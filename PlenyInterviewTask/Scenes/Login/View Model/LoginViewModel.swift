//
//  LoginViewModel.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 07/03/2023.
//

import Foundation

final class LoginViewModel: BaseObservableViewModel {
    
    @Published var user: UserModel?
    @Published var auth: AuthModel = AuthModel(userName: "hbingley1", password: "CQutx25i8r")
    
    private let authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol) {
        self.authService = authService
        super.init()
        self.authenticate()
    }
}

extension LoginViewModel {
    
    func authenticate() {
        authService.auth(with: auth)
            .sink(receiveCompletion: onReceive, receiveValue: onReceive)
            .store(in: &cancellables)
    }
    
    private func onReceive(_ response: UserModel) {
        guard let id = response.id,
              let token = response.token else {
            self.errorMessage = "Wrong username or password"
            return
        }
        
        print("\(id) \(token)")
    }
}
