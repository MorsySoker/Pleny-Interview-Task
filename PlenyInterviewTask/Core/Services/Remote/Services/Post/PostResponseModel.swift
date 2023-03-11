//
//  PostResponseModel.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 11/03/2023.
//

import Foundation

// MARK: - FeedResponse
struct FeedResponse: Codable {
    var posts: [PostResponse]?
    var total: Int?
    var skip: Int?
    var limit: Int?

    enum CodingKeys: String, CodingKey {
        case posts = "posts"
        case total = "total"
        case skip = "skip"
        case limit = "limit"
    }
}

// MARK: - PostResponse
struct PostResponse: Codable, Equatable {
    var id: Int
    var body: String?
    var userID: Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case body = "body"
        case userID = "userId"
    }
}
