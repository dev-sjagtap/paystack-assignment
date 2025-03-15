//
//  DetailView.swift
//  PayStackAssignment
//
//  Created by Sushant V. Jagtap on 14/03/25.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    // MARK: - Properties
    let character: Character
    
    // MARK: - Main body implementation
    var body: some View {
        VStack {
            Text(character.name)
                .font(.title)
                .padding()
            
            Text("Species: \(character.species)")
            UILabelRepresentable(text: "Status: \(character.status)", font: UIFont.systemFont(ofSize: 15.0), textColor: UIColor.black)
                .frame(height: 50)
        }
        .navigationTitle(character.name)
        .padding()
    }
}
