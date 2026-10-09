import Foundation
import SwiftData
import Testing
@testable import _925_1

@MainActor
struct WordFlowTests {
    private let taipeiCalendar: Calendar = {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "Asia/Taipei")!
        return calendar
    }()

    @Test("學習列舉具有穩定 raw value")
    func learningEnumRawValues() {
        #expect(LearningStatus.new.rawValue == "new")
        #expect(LearningStatus.learning.rawValue == "learning")
        #expect(LearningStatus.reviewing.rawValue == "reviewing")
        #expect(LearningStatus.mastered.rawValue == "mastered")
        #expect(SelfAssessment.forgot.rawValue == "forgot")
        #expect(SelfAssessment.uncertain.rawValue == "uncertain")
        #expect(SelfAssessment.remembered.rawValue == "remembered")
        #expect(WordLevel.a1.rawValue == "A1")
        #expect(PartOfSpeech.noun.rawValue == "noun")
    }

    @Test("單字、字庫與進度可新增查詢及刪除")
    func wordModelsPersistInMemory() throws {
        let container = try WordFlowModelContainer.makeInMemory()
        let context = ModelContext(container)
        let deck = Deck(name: "開發字庫", level: .a1)
        let word = Word(text: "apple", definitionZH: "蘋果", level: .a1, deck: deck)
        let progress = LearningProgress(wordID: word.id, word: word)

        context.insert(deck)
        context.insert(word)
        context.insert(progress)
        try context.save()

        #expect(try context.fetch(FetchDescriptor<Word>()).count == 1)
        #expect(try context.fetch(FetchDescriptor<LearningProgress>()).first?.wordID == word.id)

        context.delete(word)
        try context.save()
        #expect(try context.fetch(FetchDescriptor<Word>()).isEmpty)
    }

    @Test("設定只有一組預設值且能保存")
    func userSettingsDefaultsPersist() throws {
        let container = try WordFlowModelContainer.makeInMemory()
        let context = ModelContext(container)
        let settings = try UserSettings.loadOrCreate(in: context)
        _ = try UserSettings.loadOrCreate(in: context)

        #expect(try context.fetch(FetchDescriptor<UserSettings>()).count == 1)
        #expect(settings.identifier == UserSettings.currentUserIdentifier)
        #expect(settings.dailyNewWordGoal == 10)
        #expect(!settings.reminderEnabled)
        #expect(!settings.hasCompletedOnboarding)
    }

    @Test("學習紀錄可計算字數與正確率")
    func studySessionMetrics() {
        let session = StudySession(newWordCount: 10, reviewWordCount: 15, correctCount: 12)
        #expect(session.studiedWordCount == 25)
        #expect(session.accuracy == 0.8)
        #expect(StudySession().accuracy == nil)
    }

    @Test("開發字庫可解碼，且重複匯入不新增資料")
    func seedImportIsIdempotent() throws {
        let data = try SeedDataImporter.developmentWordData()
        let seeds = try JSONDecoder().decode([SeedWord].self, from: data)
        #expect(seeds.count == 24)
        #expect(Set(seeds.map(\.id)).count == seeds.count)
        #expect(seeds.allSatisfy { !$0.text.isEmpty && !$0.definitionZH.isEmpty })

        let container = try WordFlowModelContainer.makeInMemory()
        let context = ModelContext(container)
        try SeedDataImporter.importIfNeeded(into: context, data: data)
        try SeedDataImporter.importIfNeeded(into: context, data: data)

        #expect(try context.fetch(FetchDescriptor<Word>()).count == seeds.count)
    }

    @Test("複習排程會依自評設定正確的下一次日期")
    func reviewSchedulingIntervals() throws {
        let scheduler = ReviewScheduler(calendar: taipeiCalendar)
        let date = try #require(taipeiCalendar.date(from: DateComponents(year: 2026, month: 3, day: 7, hour: 9)))
        let progress = LearningProgress(wordID: UUID())

        scheduler.apply(.forgot, to: progress, at: date)
        #expect(progress.nextReviewAt == taipeiCalendar.date(byAdding: .minute, value: 10, to: date))
        #expect(progress.status == .learning)

        scheduler.apply(.uncertain, to: progress, at: date)
        #expect(progress.nextReviewAt == taipeiCalendar.date(byAdding: .day, value: 1, to: date))

        scheduler.apply(.remembered, to: progress, at: date)
        #expect(progress.nextReviewAt == taipeiCalendar.date(byAdding: .day, value: 3, to: date))

        scheduler.apply(.remembered, to: progress, at: date)
        #expect(progress.nextReviewAt == taipeiCalendar.date(byAdding: .day, value: 7, to: date))
    }

    @Test("跨夏令時間與七天間隔後，第三次記得會標示為已掌握")
    func reviewSchedulingHandlesDSTAndMastery() throws {
        var pacificCalendar = Calendar(identifier: .gregorian)
        pacificCalendar.timeZone = try #require(TimeZone(identifier: "America/Los_Angeles"))
        let scheduler = ReviewScheduler(calendar: pacificCalendar)
        let start = try #require(pacificCalendar.date(from: DateComponents(year: 2026, month: 3, day: 7, hour: 9)))
        let nextDay = try #require(pacificCalendar.date(byAdding: .day, value: 1, to: start))
        let progress = LearningProgress(wordID: UUID(), familiarity: 2, correctCount: 2, lastReviewedAt: start)

        scheduler.apply(.uncertain, to: progress, at: start)
        #expect(progress.nextReviewAt == nextDay)

        let thirdReview = try #require(pacificCalendar.date(byAdding: .day, value: 7, to: start))
        scheduler.apply(.remembered, to: progress, at: thirdReview)
        #expect(progress.status == .mastered)
        #expect(progress.nextReviewAt == pacificCalendar.date(byAdding: .day, value: 14, to: thirdReview))
    }

    @Test("每日任務先列出十五個到期複習，再加入十個新字")
    func dailyStudyPlanPrioritizesReviewsAndNewWords() {
        let date = Date.now
        let reviewWords = (0..<15).map {
            Word(text: "review-\($0)", definitionZH: "複習", level: .a1, displayOrder: $0)
        }
        let newWords = (0..<12).map {
            Word(text: "new-\($0)", definitionZH: "新字", level: .a1, displayOrder: $0 + 20)
        }
        let progressByWordID = Dictionary(
            uniqueKeysWithValues: reviewWords.map {
                ($0.id, LearningProgress(wordID: $0.id, status: .reviewing, nextReviewAt: date))
            }
        )

        let plan = DailyStudyPlanner().makePlan(
            words: reviewWords + newWords,
            progressByWordID: progressByWordID,
            dailyNewWordGoal: 10,
            at: date
        )

        #expect(plan.reviewCount == 15)
        #expect(plan.newCount == 10)
        #expect(plan.tasks.prefix(15).allSatisfy { $0.kind == .review })
        #expect(DailyStudyPlanner().makePlan(words: [], progressByWordID: [:], dailyNewWordGoal: 10, at: date).isComplete)
    }

    @Test("忘記的單字只會在同一輪稍後加入一次")
    func retryTaskIsInsertedOnlyOnce() {
        let wordID = UUID()
        let tasks = [
            StudyTask(id: wordID, kind: .review),
            StudyTask(id: UUID(), kind: .new),
            StudyTask(id: UUID(), kind: .new)
        ]

        let planner = DailyStudyPlanner()
        let withRetry = planner.insertRetry(for: wordID, after: 0, in: tasks)
        #expect(withRetry[2].kind == .retry)
        #expect(planner.insertRetry(for: wordID, after: 0, in: withRetry) == withRetry)
    }

    @Test("WordFlow 測試 target 可執行")
    func smokeTest() {
        #expect(true)
    }
}
