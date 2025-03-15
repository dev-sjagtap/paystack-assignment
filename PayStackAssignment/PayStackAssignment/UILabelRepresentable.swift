//
//  UILabelRepresentable.swift
//  PayStackAssignment
//
//  Created by Sushant V. Jagtap on 14/03/25.
//

import UIKit
import SwiftUI

struct UILabelRepresentable: UIViewRepresentable {
    
    // MARK: - Properties
    var text: String
    var font: UIFont
    var textColor: UIColor
    
    // MARK: - Methods
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
        uiView.font = font
        uiView.textColor = textColor
    }
}
