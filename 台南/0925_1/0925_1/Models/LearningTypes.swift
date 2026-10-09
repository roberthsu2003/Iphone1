import Foundation

enum LearningStatus: String, Codable, CaseIterable, Sendable {
    case new
    case learning
    case reviewing
    case mastered
}

enum SelfAssessment: String, Codable, CaseIterable, Sendable {
    case forgot
    case uncertain
    case remembered
}

enum WordLevel: String, Codable, CaseIterable, Sendable {
    case a1 = "A1"
    case a2 = "A2"
}

enum PartOfSpeech: String, Codable, CaseIterable, Sendable {
    case noun
    case verb
    case adjective
    case adverb
    case pronoun
    case preposition
    case conjunction
    case interjection
    case determiner
}