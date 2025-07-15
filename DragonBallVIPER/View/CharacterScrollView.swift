//
//  CharacterListView.swift
//  DragonBallVIPER
//
//  Created by JJ Romero Alvarez on 14/7/25.
//
import SwiftUI

struct CharacterListView: View {
    @ObservedObject var presenter: CharactersPresenter

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(presenter.characters, id: \.id) { character in
                        CharacterRowView(character: character)
                    }
                }
                .padding()
            }
            .navigationTitle("Characters")
            .onAppear {
                presenter.fetchCharacters()
            }
        }
    }
}
