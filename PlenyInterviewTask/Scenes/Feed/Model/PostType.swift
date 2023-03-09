//
//  PostType.swift
//  PlenyInterviewTask
//
//  Created by Morsy Mohamed Elsokary on 09/03/2023.
//

import Foundation

/// A type container associated with post body.
enum PostType: Codable {
    case text(_ text: String)
    case images(_ imagesURL: [String])
    case textWithImages(_ text: String, _ imagesURL: [String])
}
