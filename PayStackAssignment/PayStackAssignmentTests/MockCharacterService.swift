//
//  MockCharacterService.swift
//  PayStackAssignment
//
//  Created by Sushant V. Jagtap on 15/03/25.
//

import Foundation
@testable import PayStackAssignment

class MockCharacterService: CharacterService {
    
    var mockResult: Result<[Character], Error>?

    override func fetchCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        if let result = mockResult {
            completion(result)
        }
    }
}
