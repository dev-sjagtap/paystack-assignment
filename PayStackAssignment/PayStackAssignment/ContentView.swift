//
//  ContentView.swift
//  PayStackAssignment
//
//  Created by Sushant V. Jagtap on 12/03/25.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @StateObject private var apiManager = APIManager()
    
    // MARK: - Main body implementation
    var body: some View {
        
        NavigationStack {
            List(apiManager.characters) { character in
                NavigationLink(destination: DetailView(character: character)) {
                    HStack {
                        Text(character.name)
                    }
                }
            }
        }
        .onAppear {
            apiManager.fetchCharacters()
        }
        .navigationTitle("Rick and Morty Characters")
    }
    
}

#Preview {
    ContentView()
}
