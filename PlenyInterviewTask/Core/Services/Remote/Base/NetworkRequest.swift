import Foundation

public struct NetworkRequest {
    var path: String
    var headers: [String: String]
    var queryBody: Any?
    var requestTimeOut: Float?
    var httpMethod: HTTPMethod
    var apiAuthorization: APIAuthorization
    var parameters: Parameters?
    
    var discription: String {
        url.absoluteString
    }
    
    var quaryItems: [URLQueryItem]? {
        parameters?.map ({ URLQueryItem.init(name: $0.key, value: "\($0.value)") })
    }
    
    private var body: Data? {
        if let queryBody = self.queryBody as? [String:Any] {
            return try? JSONSerialization.data(withJSONObject: queryBody)
        }
        return nil
    }
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = BaseDomain.production.rawValue
        components.path = path
        components.queryItems = quaryItems
        return components.url!
    }

    public init(
        path: String,
        requestBody: Any? = nil,
        requestTimeout: Float? = nil,
        parameters: Parameters? = nil,
        httpMethod: HTTPMethod,
        apiAuthorization: APIAuthorization
    ) {
        self.path = path
        self.queryBody = requestBody
        self.requestTimeOut = requestTimeout
        self.parameters = parameters
        self.httpMethod = httpMethod
        self.apiAuthorization = apiAuthorization
        headers = ["Content-Type": "application/json"]
        appendBearerToken()
    }
    
    mutating private func appendBearerToken() {
        switch apiAuthorization {
        case .none:
            break
        case .bearerToken:
            guard let authHeader = apiAuthorization.authData as? [String: String] else {
                fatalError("bearerToken header must be as [String:String]")
            }
            headers.merge(authHeader) { (_, new) in new }
        }
    }
    
    func buildURLRequest(with url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = body
        return urlRequest
    }
}
