//
//  TextTypePost.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 10/03/2023.
//

import SwiftUI

struct TextTypePost: View {
    let text: String
    var body: some View {
        Text(text)
            .multilineTextAlignment(.leading)
            .font(.sfRegular(of: 17))
            .foregroundColor(.titleColor)
    }
}
