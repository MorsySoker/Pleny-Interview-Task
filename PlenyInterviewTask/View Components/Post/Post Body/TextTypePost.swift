//
//  TextTypePost.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 10/03/2023.
//

import SwiftUI

struct TextTypePost: View {
    let text: String
    @Binding var searchText: String
    var body: some View {
        hilightedText(text: text, searched: searchText)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .multilineTextAlignment(.leading)
            .font(.sfRegular(of: 17))
            .foregroundColor(.titleColor)
    }
    
    func hilightedText(text: String, searched: String) -> Text {
        guard !text.isEmpty && !searched.isEmpty else { return Text(text) }

        var result: Text!
        let parts = text.components(separatedBy: searched)
        for i in parts.indices {
            result = (result == nil ? Text(parts[i]) : result + Text(parts[i]))
            if i != parts.count - 1 {
                result = result + Text(searched).bold()
            }
        }
        return result ?? Text(text)
    }
}
