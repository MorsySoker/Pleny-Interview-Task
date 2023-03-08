//
//  LoginView.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 07/03/2023.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - View States
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
        VStack(alignment: .leading, spacing: 24) {
            poster
            welcome
            VStack(alignment: .leading, spacing: 24) {
                FieldSection(sectionTitle: "User Name", text: $viewModel.auth.userName)
                FieldSection(sectionTitle: "Password", text: $viewModel.auth.password)
            }
            .padding(.horizontal, 16)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
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


struct FieldSection: View {
    var sectionTitle: String
    @Binding var text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(sectionTitle)
                .foregroundColor(.textColor)
                .font(.sfSemiBold(of: 15))
            
            TextField(text: $, axis: <#T##Axis#>, label: <#T##() -> View#>)
        }
    }
}
