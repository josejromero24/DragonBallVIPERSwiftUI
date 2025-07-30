//
//  CharacterListView.swift
//  DragonBallVIPER
//
//  Created by JJ Romero Alvarez on 14/7/25.
//
import SwiftUI

struct CharacterListView: View {
    @ObservedObject var presenter: CharactersPresenter
    @State private var searchText: String = ""

    var filteredCharacters: [Item] {
        if searchText.isEmpty {
            return presenter.characters
        } else {
            return presenter.characters.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                TextField("Buscar por nombre...", text: $searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding([.horizontal, .top])

                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(filteredCharacters, id: \.id) { character in
                            CharacterRowView(character: character)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Characters")
            .onAppear {
                presenter.fetchCharacters()
            }
        }
    }
}
