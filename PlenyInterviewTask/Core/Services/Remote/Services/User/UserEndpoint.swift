//
//  UserEndpoint.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 11/03/2023.
//

import Foundation

enum UserEndpoint: RequestEndpoint {

case getUser(withId: Int)
    
    var parameters: Parameters? {
//        switch self {
//        case .getUser:
//            return ["select": ["firstName", "maidenName"]]
//        }
        nil
    }
    
    var requestBody: Any? {
        nil
    }
    
    var path: String {
        switch self {
        case .getUser(let userId):
            return "/users/\(userId)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getUser:
            return .get
        }
    }
    
    func createRequest() -> NetworkRequest {
        NetworkRequest(path: path,
                       requestBody: requestBody,
                       parameters: parameters,
                       httpMethod: httpMethod,
                       apiAuthorization: apiAuthorization)
    }
}
