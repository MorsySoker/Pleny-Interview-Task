//
//  TextWithImagesTypePost.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 10/03/2023.
//

import SwiftUI

struct TextWithImagesTypePost: View {
    
    let text: String
    let images: [String]
    @Binding var searchText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            TextTypePost(text: text, searchText: $searchText)
            if !images.isEmpty {
                PostImagesGrid(images: images)
            }
        }
    }
}
