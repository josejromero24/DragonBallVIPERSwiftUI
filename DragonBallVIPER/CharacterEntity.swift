//
//  ContentView.swift
//  DragonBallVIPER
//
//  Created by JJ Romero Alvarez on 14/7/25.
//

import Foundation

struct CharacterEntity: Identifiable, Decodable {
    let id: String
    let name: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case image
    }
}

