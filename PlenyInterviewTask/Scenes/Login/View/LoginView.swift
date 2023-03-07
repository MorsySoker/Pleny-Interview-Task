//
//  LoginView.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 07/03/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    init(requestable: Requestable = NetworkRequestable()) {
        _viewModel = StateObject(wrappedValue: LoginViewModel(authService: AuthService(networkService: requestable)))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
