//
//  CharacterInteractor.swift
//  DragonBallVIPER
//
//  Created by JJ Romero Alvarez on 14/7/25.
//

import Foundation
import Alamofire

protocol CharactersInteractorProtocol {
    func fetchCharacters(completion: @escaping (Result<[Item], Error>) -> Void)
}

class CharacterInteractor: CharactersInteractorProtocol {
    func fetchCharacters(completion: @escaping (Result<[Item], Error>) -> Void) {
        // We use limit=500 to get all the characters and avoid pagination
        let url = "https://dragonball-api.com/api/characters?limit=500"

        AF.request(url)
            .validate()
            .responseDecodable(of: CharacterEntity.self) { response in
                switch response.result {
                case .success(let characterEntity):
                    completion(.success(characterEntity.items))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
