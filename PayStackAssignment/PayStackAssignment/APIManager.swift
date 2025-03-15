//
//  APIManager.swift
//  PayStackAssignment
//
//  Created by Sushant V. Jagtap on 13/03/25.
//

import Foundation

class APIManager: ObservableObject {
    
    // MARK: - Properties
    @Published var characters = [Character]()
    
    // MARK: - Methods
    func fetchCharacters() {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(CharacterResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.characters = response.results
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
        
    }
    
}
