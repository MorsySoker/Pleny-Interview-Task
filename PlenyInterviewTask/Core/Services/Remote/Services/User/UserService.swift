//
//  UserService.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 11/03/2023.
//

import Foundation
import Combine

protocol UserServiceProtocol: RequestService {
    func getUser(withId id: Int) -> AnyPublisher<User, NetworkError>
}

final class UserService: UserServiceProtocol {

    var networkService: Requestable?
    
    var fetchEndpoint: RequestEndpoint?
    
    init(networkService: Requestable) {
        self.networkService = networkService
    }
    
    func getUser(withId id: Int) -> AnyPublisher<User, NetworkError> {
        fetchEndpoint = UserEndpoint.getUser(withId: id)
        let request = fetchEndpoint!.createRequest()
        return networkService!.fetchRequest(request)
    }
}
