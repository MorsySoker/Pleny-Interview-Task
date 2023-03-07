//
//  AuthEndpoint.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 07/03/2023.
//

import Foundation

enum AuthEndpoint: RequestEndpoint {

    
case authenticate(userName: String, password: String)
    
    var parameters: Parameters? {
        nil
    }
    
    var path: String {
        switch self {
        case .authenticate:
            return "/auth/login"
        }
    }
    
    var requestBody: Any? {
        switch self {
        case .authenticate(let userName, let password):
            return ["": userName,
                    "" : password]
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .authenticate: return .post
        }
    }
    
    func createRequest() -> NetworkRequest {
        NetworkRequest(path: path,
                       requestBody: requestBody,
                       httpMethod: httpMethod,
                       apiAuthorization: .none)
    }
}
