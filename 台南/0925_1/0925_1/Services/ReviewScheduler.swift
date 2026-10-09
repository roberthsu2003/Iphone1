import Foundation

struct ReviewScheduler {
    let calendar: Calendar

    init(calendar: Calendar = .current) {
        self.calendar = calendar
    }

    func apply(_ assessment: SelfAssessment, to progress: LearningProgress, at date: Date) {
        let previousReviewDate = progress.lastReviewedAt
        progress.lastReviewedAt = date

        switch assessment {
        case .forgot:
            progress.incorrectCount += 1
            progress.familiarity = max(0, progress.familiarity - 1)
            progress.status = .learning
            progress.nextReviewAt = calendar.date(byAdding: .minute, value: 10, to: date)

        case .uncertain:
            progress.incorrectCount += 1
            progress.status = .learning
            progress.nextReviewAt = calendar.date(byAdding: .day, value: 1, to: date)

        case .remembered:
            progress.correctCount += 1
            progress.familiarity += 1
            progress.nextReviewAt = calendar.date(
                byAdding: .day,
                value: reviewIntervalDays(for: progress.correctCount),
                to: date
            )
            progress.status = hasMastered(progress, previousReviewDate: previousReviewDate, at: date)
                ? .mastered
                : .reviewing
        }
    }

    func isDue(_ progress: LearningProgress, at date: Date) -> Bool {
        guard let nextReviewAt = progress.nextReviewAt else {
            return false
        }
        return nextReviewAt <= date
    }

    private func reviewIntervalDays(for correctCount: Int) -> Int {
        switch correctCount {
        case 1:
            3
        case 2:
            7
        default:
            14
        }
    }

    private func hasMastered(
        _ progress: LearningProgress,
        previousReviewDate: Date?,
        at date: Date
    ) -> Bool {
        guard progress.correctCount >= 3, let previousReviewDate else {
            return false
        }

        let components = calendar.dateComponents([.day], from: previousReviewDate, to: date)
        return (components.day ?? 0) >= 7
    }
}
