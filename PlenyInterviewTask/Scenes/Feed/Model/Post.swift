//
//  Post.swift
//  PlenyInterviewTask
//
//  Created by Morsy Mohamed Elsokary on 09/03/2023.
//

import Foundation

struct Post: Identifiable, Codable {
    
    /// post id
    let id: Int
    /// post type associated with its value.
    let body: PostType
    /// post creator
    let user: User
    /// timestamp since 1970 in seconds.
    let createAt: Int

    /**
     Represents a post that a user is created.
     
     - Parameter id: post id.
     - Parameter body: the body type of the post.
     - Parameter sender: the user that created the post.
     - Parameter createAt: post created at.
     
     - Returns: A post
     */
    init(id: Int, body: PostType, sender: User) {
        self.id = id
        self.body = body
        self.user = sender
        self.createAt = Int(Date().timeIntervalSince1970)
    }
    
    /// Keys for encoding and decoding data.
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case body = "body"
        case user = "user"
        case createAt = "createAt"
        
    }
}
