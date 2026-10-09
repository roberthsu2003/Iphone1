import Foundation
import SwiftData

enum WordFlowModelContainer {
    static var schema: Schema {
        Schema([
            Deck.self,
            Word.self,
            LearningProgress.self,
            UserSettings.self,
            StudySession.self,
            ReviewEvent.self
        ])
    }

    static func makePersistent() throws -> ModelContainer {
        try ModelContainer(for: schema)
    }

    static func makePreview() throws -> ModelContainer {
        try makeInMemory()
    }

    static func makeInMemory() throws -> ModelContainer {
        let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        return try ModelContainer(for: schema, configurations: [configuration])
    }
}
