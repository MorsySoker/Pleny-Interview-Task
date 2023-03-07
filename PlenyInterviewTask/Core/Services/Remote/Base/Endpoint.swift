//
//  EndPoint.swift
//  NetworkLayer
//
//  Created by MorsyElsokary on 02/11/2022.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var requestTimeOut: Int { get }
    var httpMethod: HTTPMethod { get }
    var apiAuthorization: APIAuthorization { get }
}

extension Endpoint {
    var requestTimeOut: Int {
        return 30
    }
    
    var apiAuthorization: APIAuthorization {
        .none
    }
}

protocol RequestEndpoint: Endpoint {
    var parameters: Parameters? { get }
    var requestBody: Any? { get }
    func createRequest() -> NetworkRequest
}
