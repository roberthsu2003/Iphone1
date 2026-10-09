import Foundation

struct StudyTask: Identifiable, Equatable {
    enum Kind: Equatable {
        case new
        case review
        case retry
    }

    let id: UUID
    let kind: Kind
}

struct DailyStudyPlan: Equatable {
    let tasks: [StudyTask]

    var newCount: Int {
        tasks.filter { $0.kind == .new }.count
    }

    var reviewCount: Int {
        tasks.filter { $0.kind == .review || $0.kind == .retry }.count
    }

    var isComplete: Bool {
        tasks.isEmpty
    }
}

struct DailyStudyPlanner {
    func makePlan(
        words: [Word],
        progressByWordID: [UUID: LearningProgress],
        dailyNewWordGoal: Int,
        at date: Date
    ) -> DailyStudyPlan {
        let orderedWords = words.sorted { ($0.displayOrder, $0.text) < ($1.displayOrder, $1.text) }
        let dueReviews = orderedWords.compactMap { word -> StudyTask? in
            guard let progress = progressByWordID[word.id], isDue(progress, at: date) else {
                return nil
            }
            return StudyTask(id: word.id, kind: .review)
        }

        let reviewIDs = Set(dueReviews.map(\.id))
        let newWords = orderedWords
            .filter { !reviewIDs.contains($0.id) }
            .filter { progressByWordID[$0.id] == nil || progressByWordID[$0.id]?.status == .new }
            .prefix(max(0, dailyNewWordGoal))
            .map { StudyTask(id: $0.id, kind: .new) }

        return DailyStudyPlan(tasks: dueReviews + newWords)
    }

    func insertRetry(for wordID: UUID, after currentIndex: Int, in tasks: [StudyTask]) -> [StudyTask] {
        guard currentIndex >= 0, currentIndex < tasks.count else {
            return tasks
        }
        guard !tasks.dropFirst(currentIndex + 1).contains(where: { $0.id == wordID && $0.kind == .retry }) else {
            return tasks
        }

        var updatedTasks = tasks
        let insertionIndex = min(currentIndex + 2, tasks.count)
        updatedTasks.insert(StudyTask(id: wordID, kind: .retry), at: insertionIndex)
        return updatedTasks
    }

    private func isDue(_ progress: LearningProgress, at date: Date) -> Bool {
        guard let nextReviewAt = progress.nextReviewAt else {
            return false
        }
        return nextReviewAt <= date
    }
}
