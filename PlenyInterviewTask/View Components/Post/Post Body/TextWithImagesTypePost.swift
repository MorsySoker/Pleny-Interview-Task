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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            TextTypePost(text: text)
            if !images.isEmpty {
                PostImagesGrid(images: images)
            }
        }
    }
}
