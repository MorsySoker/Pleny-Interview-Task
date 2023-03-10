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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        var allKeys = ArraySlice(container.allKeys)
        guard let onlyKey = allKeys.popFirst(), allKeys.isEmpty else {
            throw DecodingError.typeMismatch(PostType.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Invalid number of keys found, expected one.", underlyingError: nil))
        }
        switch onlyKey {
        case .text:
            let nestedContainer = try container.nestedContainer(keyedBy: PostType.TextCodingKeys.self, forKey: .text)
            self = PostType.text(body: try nestedContainer.decode(String.self, forKey: PostType.TextCodingKeys.body))
        case .images:
            let nestedContainer = try container.nestedContainer(keyedBy: PostType.ImagesCodingKeys.self, forKey: .images)
            self = PostType.images(try nestedContainer.decode([String].self, forKey: PostType.ImagesCodingKeys._0))
        case .textWithImages:
            let nestedContainer = try container.nestedContainer(keyedBy: PostType.TextWithImagesCodingKeys.self, forKey: .textWithImages)
            self = PostType.textWithImages(try nestedContainer.decode(String.self, forKey: PostType.TextWithImagesCodingKeys._0), try nestedContainer.decode([String].self, forKey: PostType.TextWithImagesCodingKeys._1))
        }
    }
}
