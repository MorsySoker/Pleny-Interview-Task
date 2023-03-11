//
//  PostType.swift
//  PlenyInterviewTask
//
//  Created by Morsy Mohamed Elsokary on 09/03/2023.
//

import Foundation

/// A type container associated with post body.
enum PostType: Codable {
    case text(body: String)
    case images(_ imagesURL: [String])
    case textWithImages(_ text: String, _ imagesURL: [String])
    
    static func randomType(body: String) -> PostType {
        var images: [String] {
            let images: [String] = ["foodImage1", "foodImage2", "foodImage3", "foodImage4", "foodImage5",
                                    "foodImage6", "foodImage7", "foodImage9", "foodImage10"]
            var arrayOfImages: [String] = []
            for _ in 0...(Int.random(in: 0...6))  {
                arrayOfImages.append(images.randomElement()!)
            }
            
            return arrayOfImages
        }
        let types: [PostType] = [.text(body: body),
                                 .textWithImages(body, images),
                                 .textWithImages(body, images),
                                 .textWithImages(body, images)]
        
       return types.randomElement()!
    }
}
