//
//  CharacterViewModel.swift
//  PayStackAssignment
//
//  Created by Sushant V. Jagtap on 15/03/25.
//

import Foundation

class CharacterViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var characters: [Character] = []
    @Published var errorMessage: String?
    
    private let characterService: CharacterService
    
    // MARK: - Init methods
    init(characterService: CharacterService = CharacterService()) {
        self.characterService = characterService
    }
    
    // MARK: - Methods
    func fetchCharacters() {
        characterService.fetchCharacters { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let characters):
                    self?.characters = characters
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
}
