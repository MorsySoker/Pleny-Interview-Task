import Foundation

public typealias Headers = [String: String]
public typealias Parameters = [String: Any]
public typealias QueryBody = [String: Any]

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

public enum APIAuthorization {
    case none
    case bearerToken
    
    var authData: Any {
        switch self {
        case .none:
            return [:]
        case .bearerToken:
            return ["Authorization": "Bearer "]
        }
    }
}

extension Encodable {
    func encode() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            return nil
        }
    }
}

