//
//  CharacterService.swift
//  PayStackAssignment
//
//  Created by Sushant V. Jagtap on 15/03/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
}

class CharacterService {
    
    func fetchCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let characters = try JSONDecoder().decode(CharacterResponse.self, from: data)
                completion(.success(characters.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
