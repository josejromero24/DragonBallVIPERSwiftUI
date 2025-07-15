//
//  CharacterRouter.swift
//  DragonBallVIPER
//
//  Created by JJ Romero Alvarez on 14/7/25.
//

import SwiftUI

struct CharacterRouter {
    static func createModule() -> some View {
        let presenter = CharactersPresenter()
        return CharacterListView(presenter: presenter)
    }
}
