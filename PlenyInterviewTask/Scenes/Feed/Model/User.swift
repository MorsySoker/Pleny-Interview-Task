//
//  User.swift
//  PlenyInterviewTask
//
//  Created by Morsy Mohamed Elsokary on 09/03/2023.
//

import Foundation

struct User: Identifiable, Codable {
    
    let id: Int
    let name: String
    let avatar: String?
    
    /**
     Represents a user that is either a sender or a reciever.
     
     - Parameter id: an id can be a uuid, fcm or any generic id.
     - Parameter name: display name.
     - Parameter avatar: user avatar it could be stringUrl, or static image .
     
     A user may or may not have an avatar.
     
     - Returns: A user with the specified info
     */
    init(id: Int, name: String, avatar: String?) {
        self.id = id
        self.name = name
        self.avatar = avatar
    }
    
    /// Keys for encoding and decoding data.
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case avatar = "avatar"
    }
}