//
//  PostEndpoint.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 10/03/2023.
//

import Foundation

enum PostEndpoint: RequestEndpoint {
    
    case getPosts(limit: Int, skip: Int)
    
    var parameters: Parameters? {
        switch self {
        case .getPosts(let limit, let skip):
            return ["limit" : limit,
                    "skip" : skip]
        }
    }
    
    var requestBody: Any? {
        nil
    }
    
    var path: String {
        switch self {
        case .getPosts:
            return "/posts"
        }
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    func createRequest() -> NetworkRequest {
        NetworkRequest(path: path,
                       requestBody: requestBody,
                       parameters: parameters,
                       httpMethod: httpMethod,
                       apiAuthorization: apiAuthorization)
    }
}
