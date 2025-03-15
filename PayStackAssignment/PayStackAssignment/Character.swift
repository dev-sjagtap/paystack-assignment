//
//  Character.swift
//  PayStackAssignment
//
//  Created by Sushant V. Jagtap on 13/03/25.
//

import Foundation


struct Character: Identifiable, Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
}

struct CharacterResponse: Codable {
    let results: [Character]
}
