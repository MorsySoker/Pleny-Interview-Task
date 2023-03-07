//
//  AuthService.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 07/03/2023.
//

import Foundation
import Combine

protocol AuthServiceProtocol: RequestService {
    func auth(with credentials: AuthModel) -> AnyPublisher<UserModel, NetworkError>
}

final class AuthService: AuthServiceProtocol {

    var networkService: Requestable?
    
    var fetchEndpoint: RequestEndpoint?
    
    init(networkService: Requestable) {
        self.networkService = networkService
    }
    
    func auth(with credentials: AuthModel) -> AnyPublisher<UserModel, NetworkError> {
        fetchEndpoint = AuthEndpoint.authenticate(authModel: credentials)
        let request = fetchEndpoint!.createRequest()
        return networkService!.fetchRequest(request)
    }
}
