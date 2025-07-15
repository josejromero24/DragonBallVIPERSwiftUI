//
//  CharactersPresenter.swift
//  DragonBallVIPER
//
//  Created by JJ Romero Alvarez on 14/7/25.
//
import Foundation

class CharactersPresenter: ObservableObject {
    @Published var characters: [Item] = []

    private let interactor: CharactersInteractorProtocol

    init(interactor: CharactersInteractorProtocol = CharacterInteractor()) {
        self.interactor = interactor
    }

    func fetchCharacters() {
        interactor.fetchCharacters { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let characters):
                    self?.characters = characters
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}

