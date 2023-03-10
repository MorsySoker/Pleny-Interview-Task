//
//  PostService.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 10/03/2023.
//

import Foundation
import Combine

protocol PostServiceProtocol: RequestService {
    func getPosts(with limit: Int, skip: Int) -> AnyPublisher<Feed, NetworkError>
}

final class PostService: PostServiceProtocol {
    
    var networkService: Requestable?
    
    var fetchEndpoint: RequestEndpoint?
    
    init(networkService: Requestable) {
        self.networkService = networkService
    }
    
    func getPosts(with limit: Int, skip: Int) -> AnyPublisher<Feed, NetworkError> {
        fetchEndpoint = PostEndpoint.getPosts(limit: limit, skip: skip)
        let request = fetchEndpoint!.createRequest()
        return networkService!.fetchRequest(request)
    }
}
