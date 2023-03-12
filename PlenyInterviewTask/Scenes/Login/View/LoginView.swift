//
//  LoginView.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 07/03/2023.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - View States
    @EnvironmentObject private var appRoot: AppRouter
    @StateObject private var viewModel: LoginViewModel
    
    //MARK: - Views
    
    private var poster: some View {
        Image("loginPoster")
            .resizable()
            .scaledToFit()
    }
    
    private var welcome: some View {
        Text("Welcome")
            .font(.sfBold(of: 20))
            .foregroundColor(.appBlue)
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    private var content: some View {
        ScrollView(.vertical, showsIndicators: false) {
            // to animate the fields up when they become focused
            ScrollViewReader { scrollProxy in
                VStack(alignment: .leading, spacing: 24) {
                    poster
                    welcome
                    LoginFormView(viewModel: viewModel,
                                  scrollProxy: scrollProxy)
                }
            }
        }
        .ignoresSafeArea()
        .onChange(of: viewModel.isLoggedIn) { isLoggedIn in
            guard isLoggedIn else { return }
            appRoot.isLoggedin = isLoggedIn
            appRoot.route()
        }
    }
    
    //MARK: - Body
    var body: some View {
        BaseNavigationView { content }
    }
    
    //MARK: - Init
    init(requestable: Requestable = NetworkRequestable()) {
        _viewModel = StateObject(wrappedValue: LoginViewModel(authService: AuthService(networkService: requestable)))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
