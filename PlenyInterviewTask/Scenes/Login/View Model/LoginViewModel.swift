//
//  LoginViewModel.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 07/03/2023.
//

import Foundation

final class LoginViewModel: BaseObservableViewModel {
    
    //MARK: - Properties
    @Published var user: LoggedUser?
    @Published var auth: AuthModel = AuthModel(userName: "atuny0", password: "9uQFF1Lh")
    @Published var isValidToAuth: Bool = false
    @Published var isLoggedIn: Bool = false
    
    //Services
    private let authService: AuthServiceProtocol
    
    //MARK: - init
    init(authService: AuthServiceProtocol) {
        self.authService = authService
        super.init()
        self.subToValidation()
    }
    
    //MARK: - Methods
    private func subToValidation() {
        $auth
            .map { !$0.userName.isEmpty && !$0.password.isEmpty }
            .assign(to: &$isValidToAuth)
    }
}

extension LoginViewModel {
    
    func authenticate() {
        self.isLoading = true
        authService.auth(with: auth)
            .sink(receiveCompletion: onReceive, receiveValue: onReceive)
            .store(in: &cancellables)
    }
    
    private func onReceive(_ response: LoggedUser) {
        guard let id = response.id,
              let token = response.token else {
            self.isLoading = false
            self.errorMessage = "Wrong username or password"
            return
        }
        self.isLoading = false
        print("\(id) \(token)")
        self.isLoggedIn = true
    }
}
