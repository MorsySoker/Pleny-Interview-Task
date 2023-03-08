//
//  FieldSection.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 08/03/2023.
//

import SwiftUI

struct FieldSection: View {
    var sectionTitle: String
    var placerHolder: String
    var inputType: UITextContentType
    @Binding var text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(sectionTitle)
                .foregroundColor(.textColor)
                .font(.sfSemiBold(of: 15))
            
            TextFieldView($text,
                          placeholder: placerHolder,
                          inputType: inputType,
                          hasShadow: false,
                          hasBoarder: true)
        }
    }
}
