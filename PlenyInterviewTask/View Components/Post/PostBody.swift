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

struct TextTypePost: View {
    let text: String
    var body: some View {
        Text(text)
            .multilineTextAlignment(.leading)
            .font(.sfRegular(of: 17))
            .foregroundColor(.titleColor)
    }
}

struct ImagesTypePost: View {
    let images: [String]
    
    var body: some View {
        if !images.isEmpty {
            PostImagesGrid(images: images)
        }
    }
}

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

struct PostImagesGrid: View {
    let images: [String]
    
    @ViewBuilder
    private var imagesGrid: some View {
        switch images.count {
        case 1: oneImage
        case 2: TwoImagesGrid(images: images)
        case 3: ThreeImageGrid(images: images)
        default: ImageGallaryGrid(images: images)
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
            .frame(maxWidth: .infinity, alignment: .center)
            .cornerRadius(8)
    }
}

struct TwoImagesGrid: View {
    
    let images: [String]
    var columns: [GridItem] =
    Array(repeating: .init(.adaptive(minimum: 170), spacing: 3, alignment: .center), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .center, spacing: 3) {
            ForEach(images, id: \.self) {
                Image($0)
                    .resizable()
                    .frame(height: 178)
                    .scaledToFit()
            }
        }
    }
}

struct ThreeImageGrid: View {
    
    let images: [String]
    let rows: [GridItem] = Array(repeating: .init(.fixed(170),
                                                  spacing: 10,
                                                  alignment: .center),
                                 count: 2)
    var body: some View {
        GeometryReader { _ in
            HStack(alignment: .top, spacing: 3) {
                Image(images.first!)
                    .scaledToFill()
                    .clipped()
                
                LazyHGrid(rows: rows, alignment: .center, spacing: 0) {
                    ForEach(images.dropFirst(), id: \.self) { image in
                        Image(image)
                            .scaledToFit()
                            .clipped()
                    }
                }
            }
        }
        .frame(height: 343)
    }
}

struct ImageGallaryGrid: View {
    
    let images: [String]
    let rows: [GridItem] = Array(repeating: .init(.fixed(170),
                                                  spacing: 3,
                                                  alignment: .center), count: 2)
    var body: some View {
        LazyHGrid(rows: rows, alignment: .center, spacing: 3) {
            ForEach(images.prefix(images.count > 4 ? 3 : 4), id: \.self) { image in
                Image(image)
                    .resizable()
                    .frame(width: 170)
                    .clipped()
            }
            
            if images.count > 4 {
                Image(images[4])
                    .resizable()
                    .frame(width: 170)
                    .clipped()
                    .overlay(alignment: .center) {
                        Color.textColor
                            .opacity(0.7)
                            .overlay(alignment: .center) {
                                Text("+\(images.count - 4)")
                                    .font(.sfBold(of: 20))
                                    .foregroundColor(.white)
                            }
                    }
            }
        }
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
