//
//  ImagesTypePost.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 10/03/2023.
//

import SwiftUI

struct ImagesTypePost: View {
    let images: [String]
    
    var body: some View {
        if !images.isEmpty {
            PostImagesGrid(images: images)
        }
    }
}
