//
//  ContentView.swift
//  DragonBallVIPER
//
//  Created by JJ Romero Alvarez on 14/7/25.
//

import Foundation
import SwiftUICore

struct CharacterEntity: Codable {
    let items: [Item]
    let meta: Meta
    let links: Links
}

struct Item: Identifiable, Codable {
    let id: Int
    let name, ki, maxKi, race: String
    let gender: Gender
    let description: String
    let image: String
    let affiliation: Affiliation
    let deletedAt: JSONNull?
}

enum Affiliation: String, Codable {
    case armyOfFrieza = "Army of Frieza"
    case freelancer = "Freelancer"
    case zFighter = "Z Fighter"
    case assistantOfBeerus = "Assistant of Beerus"
    case assistantOfVermoud = "Assistant of Vermoud"
    case prideTroopers = "Pride Troopers"
    case villain = "Villain"
    case other = "Other"
    case unknown
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        self = Affiliation(rawValue: value) ?? .unknown
    }
    
    /// Color para mostrar según el tipo de afiliación
    var color: Color {
        switch self {
        case .villain:
            return .red
        case .zFighter:
            return .blue
        case .armyOfFrieza:
            return .purple
        case .freelancer:
            return .green
        case .assistantOfBeerus, .assistantOfVermoud:
            return .orange
        case .prideTroopers:
            return .yellow
        case .other, .unknown:
            return .gray
        }
    }
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
}

struct Links: Codable {
    let first: String
    let previous: String
    let next, last: String
}

struct Meta: Codable {
    let totalItems, itemCount, itemsPerPage, totalPages: Int
    let currentPage: Int
}

// MARK: - JSONNull helper

class JSONNull: Codable, Hashable {
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int { return 0 }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
