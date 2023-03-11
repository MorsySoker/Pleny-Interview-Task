//
//  PostService.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 10/03/2023.
//

import Foundation
import Combine

// MARK: - BasicResponse
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

// MARK: - Post
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

protocol PostServiceProtocol: RequestService {
    func getPosts(with limit: Int, skip: Int) -> AnyPublisher<FeedResponse, NetworkError>
}

final class PostService: PostServiceProtocol {
    
    var networkService: Requestable?
    
    var fetchEndpoint: RequestEndpoint?
    
    init(networkService: Requestable) {
        self.networkService = networkService
    }
    
    func getPosts(with limit: Int, skip: Int) -> AnyPublisher<FeedResponse, NetworkError> {
        fetchEndpoint = PostEndpoint.getPosts(limit: limit, skip: skip)
        let request = fetchEndpoint!.createRequest()
        return networkService!.fetchRequest(request)
    }
}
