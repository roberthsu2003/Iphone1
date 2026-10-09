import Foundation
import SwiftData

@Model
final class Deck {
    @Attribute(.unique) var id: UUID
    var name: String
    var level: WordLevel
    var displayOrder: Int
    @Relationship(deleteRule: .cascade, inverse: \Word.deck) var words: [Word]

    init(id: UUID = UUID(), name: String, level: WordLevel, displayOrder: Int = 0) {
        self.id = id
        self.name = name
        self.level = level
        self.displayOrder = displayOrder
        self.words = []
    }
}

@Model
final class Word {
    @Attribute(.unique) var id: UUID
    var text: String
    var phonetic: String?
    var partOfSpeech: PartOfSpeech?
    var definitionZH: String
    var exampleEN: String?
    var exampleZH: String?
    var audioReference: String?
    var level: WordLevel
    var tags: [String]
    var displayOrder: Int
    var deck: Deck?
    @Relationship(deleteRule: .cascade, inverse: \LearningProgress.word) var learningProgress: LearningProgress?

    init(
        id: UUID = UUID(),
        text: String,
        phonetic: String? = nil,
        partOfSpeech: PartOfSpeech? = nil,
        definitionZH: String,
        exampleEN: String? = nil,
        exampleZH: String? = nil,
        audioReference: String? = nil,
        level: WordLevel,
        tags: [String] = [],
        displayOrder: Int = 0,
        deck: Deck? = nil
    ) {
        self.id = id
        self.text = text
        self.phonetic = phonetic
        self.partOfSpeech = partOfSpeech
        self.definitionZH = definitionZH
        self.exampleEN = exampleEN
        self.exampleZH = exampleZH
        self.audioReference = audioReference
        self.level = level
        self.tags = tags
        self.displayOrder = displayOrder
        self.deck = deck
        self.learningProgress = nil
    }
}

@Model
final class LearningProgress {
    @Attribute(.unique) var wordID: UUID
    var status: LearningStatus
    var familiarity: Int
    var correctCount: Int
    var incorrectCount: Int
    var lastReviewedAt: Date?
    var nextReviewAt: Date?
    var isFavorite: Bool
    var word: Word?

    init(
        wordID: UUID,
        status: LearningStatus = .new,
        familiarity: Int = 0,
        correctCount: Int = 0,
        incorrectCount: Int = 0,
        lastReviewedAt: Date? = nil,
        nextReviewAt: Date? = nil,
        isFavorite: Bool = false,
        word: Word? = nil
    ) {
        self.wordID = wordID
        self.status = status
        self.familiarity = familiarity
        self.correctCount = correctCount
        self.incorrectCount = incorrectCount
        self.lastReviewedAt = lastReviewedAt
        self.nextReviewAt = nextReviewAt
        self.isFavorite = isFavorite
        self.word = word
    }
}

@Model
final class UserSettings {
    static let currentUserIdentifier = "current-user"

    @Attribute(.unique) var identifier: String
    var dailyNewWordGoal: Int
    var reminderEnabled: Bool
    var reminderTime: Date?
    var pronunciationVoice: String?
    var selectedDeckID: UUID?
    var hasCompletedOnboarding: Bool

    init(
        identifier: String = UserSettings.currentUserIdentifier,
        dailyNewWordGoal: Int = 10,
        reminderEnabled: Bool = false,
        reminderTime: Date? = nil,
        pronunciationVoice: String? = nil,
        selectedDeckID: UUID? = nil,
        hasCompletedOnboarding: Bool = false
    ) {
        self.identifier = identifier
        self.dailyNewWordGoal = dailyNewWordGoal
        self.reminderEnabled = reminderEnabled
        self.reminderTime = reminderTime
        self.pronunciationVoice = pronunciationVoice
        self.selectedDeckID = selectedDeckID
        self.hasCompletedOnboarding = hasCompletedOnboarding
    }

    static func loadOrCreate(in context: ModelContext) throws -> UserSettings {
        let identifier = UserSettings.currentUserIdentifier
        let descriptor = FetchDescriptor<UserSettings>(
            predicate: #Predicate { $0.identifier == identifier }
        )
        if let existingSettings = try context.fetch(descriptor).first {
            return existingSettings
        }

        let settings = UserSettings()
        context.insert(settings)
        try context.save()
        return settings
    }
}

@Model
final class StudySession {
    @Attribute(.unique) var id: UUID
    var startedAt: Date
    var finishedAt: Date?
    var newWordCount: Int
    var reviewWordCount: Int
    var correctCount: Int
    @Relationship(deleteRule: .cascade, inverse: \ReviewEvent.session) var reviewEvents: [ReviewEvent]

    init(
        id: UUID = UUID(),
        startedAt: Date = .now,
        finishedAt: Date? = nil,
        newWordCount: Int = 0,
        reviewWordCount: Int = 0,
        correctCount: Int = 0
    ) {
        self.id = id
        self.startedAt = startedAt
        self.finishedAt = finishedAt
        self.newWordCount = newWordCount
        self.reviewWordCount = reviewWordCount
        self.correctCount = correctCount
        self.reviewEvents = []
    }

    var studiedWordCount: Int {
        newWordCount + reviewWordCount
    }

    var accuracy: Double? {
        guard reviewWordCount > 0 else { return nil }
        return Double(correctCount) / Double(reviewWordCount)
    }
}

@Model
final class ReviewEvent {
    @Attribute(.unique) var id: UUID
    var wordID: UUID
    var reviewedAt: Date
    var assessment: SelfAssessment
    var wasCorrect: Bool
    var session: StudySession?

    init(
        id: UUID = UUID(),
        wordID: UUID,
        reviewedAt: Date = .now,
        assessment: SelfAssessment,
        wasCorrect: Bool,
        session: StudySession? = nil
    ) {
        self.id = id
        self.wordID = wordID
        self.reviewedAt = reviewedAt
        self.assessment = assessment
        self.wasCorrect = wasCorrect
        self.session = session
    }
}
