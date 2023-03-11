import Combine
import Foundation

public protocol Requestable {
    var defualtRequestTimeout: Float { get }
    func fetchRequest<T: Codable>(_ request: NetworkRequest) -> AnyPublisher<T, NetworkError>
}

public final class NetworkRequestable: Requestable {
    
    // MARK: - Properties
    
    public var defualtRequestTimeout: Float
    private var decoder: JSONDecoder {
        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
    
    public init() {
        self.defualtRequestTimeout = 30.0
    }
    
    // MARK: - Methods
    
    public func fetchRequest<T>(_ request: NetworkRequest) -> AnyPublisher<T, NetworkError> where T: Decodable {
        
#if DEBUG
        print("🚀",
              request.httpMethod.rawValue,
              request.url,
              request.headers,
              (request.parameters != nil) ? "🔑 \(request.parameters!)" : "",
              request.queryBody as? [String : Any] as Any)
#endif
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = TimeInterval(request.requestTimeOut ?? defualtRequestTimeout)
        
        guard let url = URL(string: request.url.absoluteString) else {
            return AnyPublisher(
                Fail<T, NetworkError>(error: NetworkError.badURL("Invalid Url"))
            )
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: request.buildURLRequest(with: url))
            .tryMap { output in
                guard let requestMetaData = output.response as? HTTPURLResponse else {
                    throw NetworkError.serverError(code: 0, error: "Server error")
                }
                print("Status Code: \(requestMetaData.statusCode)")
                if requestMetaData.statusCode == 401 {
                    throw NetworkError.unauthorized(code: 401, error: "Unauthorized Need Token")
                }
//                
//                print(" 🏃🏼‍♀️ \(output.response)")
//                print(" 🐤 \(output.data)")
                return output.data
            }
            .receive(on: RunLoop.main)
            .decode(type: T.self, decoder: decoder)
            .mapError { self.errorHandling($0) }
//            .print()
            .eraseToAnyPublisher()
    }
    
    private func errorHandling(_ error: Error) -> NetworkError {
        
        let networkError = error as? NetworkError
        switch networkError {
        case .invalidJSON:
            return NetworkError.invalidJSON(String(describing: "invalid Json"))
        case .unauthorized:
            return NetworkError.unauthorized(code: 401, error: "Unauthorized Need Token")
        default:
            print(error)
            return NetworkError.unknown(code: 0, error: error.localizedDescription)
        }
    }
}
