//
//  ContentView.swift
//  PayStackAssignment
//
//  Created by Sushant V. Jagtap on 12/03/25.
//

import SwiftUI
import NetStatus

struct ContentView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = CharacterViewModel()
    let networkStatus = NetStatus.shared
    
    // MARK: - Main body implementation
    var body: some View {
        
        NavigationStack {
            VStack {                
                // If there's an error, show the error message
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                if !viewModel.characters.isEmpty {
                    List(viewModel.characters) { character in
                        NavigationLink(destination: DetailView(character: character)) {
                            HStack {
                                Text(character.name)
                            }
                        }
                    }
                } else {
                    // Display a loading indicator if characters are not loaded yet
                    Text("Loading characters...")
                        .padding()
                }
            }
        }
        .onAppear {
            viewModel.fetchCharacters()
            networkStatus.stopMonitoring()
            if networkStatus.isConnected {
                print("Internect Connectivity")
            } else {
                print("No Internect Connectivity")
            }
        }
        .navigationTitle("Rick and Morty Characters")
    }
    
}

#Preview {
    ContentView()
}
