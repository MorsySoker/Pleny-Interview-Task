//
//  LoginModel.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 07/03/2023.
//

import Foundation

struct UserModel: Codable {
    var id: Int?
    var username: String?
    var email: String?
    var firstName: String?
    var lastName: String?
    var gender: String?
    var image: String?
    var token: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case username = "username"
        case email = "email"
        case firstName = "firstName"
        case lastName = "lastName"
        case gender = "gender"
        case image = "image"
        case token = "token"
    }
}
