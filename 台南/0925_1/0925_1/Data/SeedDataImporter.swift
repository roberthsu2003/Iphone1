import Foundation
import SwiftData

struct SeedWord: Codable {
    let id: UUID
    let text: String
    let phonetic: String?
    let partOfSpeech: PartOfSpeech?
    let definitionZH: String
    let exampleEN: String?
    let exampleZH: String?
    let level: WordLevel
    let tags: [String]
}

enum SeedDataImportError: LocalizedError {
    case duplicateIdentifier(UUID)
    case missingRequiredField(wordID: UUID)

    var errorDescription: String? {
        switch self {
        case .duplicateIdentifier(let id):
            "開發字庫含有重複 ID：\(id.uuidString)。"
        case .missingRequiredField(let wordID):
            "開發字庫的必要欄位為空白：\(wordID.uuidString)。"
        }
    }
}

enum SeedDataImporter {
    static func importIfNeeded(into context: ModelContext, data: Data) throws {
        let seeds = try JSONDecoder().decode([SeedWord].self, from: data)
        try validate(seeds)

        for seed in seeds {
            let descriptor = FetchDescriptor<Word>(predicate: #Predicate { $0.id == seed.id })
            guard try context.fetch(descriptor).isEmpty else {
                continue
            }

            context.insert(
                Word(
                    id: seed.id,
                    text: seed.text,
                    phonetic: seed.phonetic,
                    partOfSpeech: seed.partOfSpeech,
                    definitionZH: seed.definitionZH,
                    exampleEN: seed.exampleEN,
                    exampleZH: seed.exampleZH,
                    level: seed.level,
                    tags: seed.tags
                )
            )
        }

        if context.hasChanges {
            try context.save()
        }
    }

    static func developmentWordData() throws -> Data {
        guard let url = Bundle.main.url(forResource: "development_words", withExtension: "json") else {
            throw CocoaError(.fileNoSuchFile)
        }
        return try Data(contentsOf: url)
    }

    private static func validate(_ seeds: [SeedWord]) throws {
        var identifiers = Set<UUID>()

        for seed in seeds {
            guard identifiers.insert(seed.id).inserted else {
                throw SeedDataImportError.duplicateIdentifier(seed.id)
            }
            guard !seed.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
                  !seed.definitionZH.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                throw SeedDataImportError.missingRequiredField(wordID: seed.id)
            }
        }
    }
}
