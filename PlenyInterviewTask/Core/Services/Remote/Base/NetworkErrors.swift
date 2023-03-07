//
//  NetworkErrors.swift
//  NetworkLayer
//
//  Created by MorsyElsokary on 03/11/2022.
//

import Foundation

public enum NetworkError: Error, Equatable {
    case badURL(_ error: String)
    case apiError(code: Int, error: String)
    case invalidJSON(_ error: String)
    case unauthorized(code: Int, error: String)
    case badRequest(code: Int, error: String)
    case serverError(code: Int, error: String)
    case noResponse(_ error: String)
    case unableToParseData(_ error: String)
    case unknown(code: Int, error: String)
}

extension NetworkError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .badURL(let errorMsg):
            return NSLocalizedString("Bad Url", comment: errorMsg)
        case .invalidJSON(let errorMsg):
            return NSLocalizedString("00", comment: errorMsg)
        case .unauthorized(let code, let errorMsg):
            return NSLocalizedString("\(code)", comment: errorMsg)
        case .unknown(let code, let errorMsg):
            return NSLocalizedString(errorMsg, comment: "\(code)")
        default:
            return NSLocalizedString("Unknown Error", comment: "Unknown")
        }
    }
}
