//
//  TextFieldLabel.swift
//  Components
//
//  Created by Korashi on 03/11/2022.
//

import SwiftUI

struct TextFieldLabel: View {
    
    let text: String
    let alignment: TextAlignment
    
    init(_ text: String, textAlignment: TextAlignment) {
        self.text = text
        alignment = textAlignment
    }
    
    private var placeholderLabel: some View {
        Text(text)
            .foregroundColor(.gray)
            .multilineTextAlignment(.leading)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
    }
    
    var body: some View {
        HStack {
            if alignment == .leading {
                placeholderLabel
                Spacer()
            } else {
                Spacer()
                placeholderLabel
            }
        }
    }
}
