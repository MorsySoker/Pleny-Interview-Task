//
//  PostBody.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 10/03/2023.
//

import SwiftUI

struct PostBody: View {
    
    let postType: PostType
    @Binding var searchText: String
    
    @ViewBuilder
    private var viewType: some View {
        switch postType {
        case .text(let text):
            TextTypePost(text: text, searchText: $searchText)
        case .images(let images):
            ImagesTypePost(images: images)
        case .textWithImages(let text, let images):
            TextWithImagesTypePost(text: text, images: images, searchText: $searchText)
        }
    }
    
    var body: some View {
        viewType
    }
}
