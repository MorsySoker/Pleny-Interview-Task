//
//  User.swift
//  PlenyInterviewTask
//
//  Created by Morsy Mohamed Elsokary on 09/03/2023.
//

import Foundation

struct User: Identifiable, Codable {
    
    let animationId: String = UUID().uuidString
    let id: Int
    let firstName: String
    let maidenName: String
    var name: String {
        "\(firstName) \(maidenName)"
    }
    var avatar: String {
        let profileImages: [String] = ["companyPic", "femalePic", "malePic"]
        return profileImages.randomElement()!
    }
    
    /**
     Represents a user that is either a sender or a reciever.
     
     - Parameter id: an id can be a uuid, fcm or any generic id.
     - Parameter name: display name.
     - Parameter avatar: user avatar it could be stringUrl, or static image .
     
     A user may or may not have an avatar.
     
     - Returns: A user with the specified info
     */
    init(id: Int, firstName: String, maidenName: String) {
        self.id = id
        self.firstName = firstName
        self.maidenName = maidenName
    }
    
    /// Keys for encoding and decoding data.
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "firstName"
        case maidenName = "maidenName"
    }
}
