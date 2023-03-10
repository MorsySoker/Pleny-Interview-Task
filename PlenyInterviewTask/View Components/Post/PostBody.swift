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
        case .textWithImages(let text, let images):
            TextWithImagesTypePost(text: text, images: images)
        default: EmptyView()
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
            PostBody(postType: .text(text))
            
            AppDivider()
            
            PostBody(postType: .textWithImages(text, ["foodImage1"]))
        }
        .padding(.horizontal, 16)
    }
}

struct TextTypePost: View {
    let text: String
    var body: some View {
        Text(text)
            .multilineTextAlignment(.leading)
            .font(.sfRegular(of: 17))
            .foregroundColor(.titleColor)
    }
}

struct TextWithImagesTypePost: View {
    
    let text: String
    let images: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            TextTypePost(text: text)
            PostImagesGrid(images: images)
        }
    }
}

struct PostImagesGrid: View {
    let images: [String]
    
    @ViewBuilder
    private var imagesGrid: some View {
        switch images.count {
        case 1: oneImage
        case 2: Color.titleColor
        case 3: Color.appGrayBoarders
        default: Color.appDarkGray
        }
    }
    
    private var oneImage: some View {
        Image(images.first!)
            .resizable()
            .scaledToFill()
            .frame(height: 178)
            
    }
    
    var body: some View {
        imagesGrid
            .frame(maxWidth: .infinity)
    }
}

struct PostView: View {
    
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Group {
                PostHeader(user: post.user)
                PostBody(postType: post.body)
            }.padding(.horizontal, 16)
            AppDivider()
        }
    }
}
