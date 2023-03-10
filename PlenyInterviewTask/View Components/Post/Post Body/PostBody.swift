//
//  PostBody.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 10/03/2023.
//

import SwiftUI

struct PostBody: View {
    
    let postType: PostType
    
    @ViewBuilder
    private var viewType: some View {
        switch postType {
        case .text(let text):
            TextTypePost(text: text)
        case .images(let images):
            ImagesTypePost(images: images)
        case .textWithImages(let text, let images):
            TextWithImagesTypePost(text: text, images: images)
        }
    }
    
    var body: some View {
        viewType
    }
}

struct PostBody_Previews: PreviewProvider {
    static var previews: some View {
        let text = "Craving something delicious? Try our new dish - a savory mix of roasted vegetables and quinoa, topped with a zesty garlic. Yum!"
        VStack {
            PostBody(postType: .text(body: text))
            
            AppDivider()
            
            PostBody(postType: .textWithImages(text, ["foodImage1"]))
        }
        .padding(.horizontal, 16)
    }
}
