//
//  LoginFormView.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 08/03/2023.
//

import SwiftUI

struct LoginFormView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    let scrollProxy: ScrollViewProxy
    @FocusState private var isFoucsed: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            NavigationLink(destination: TabbarView(),
                           isActive: $viewModel.isLoggedIn,
                           label: {}).labelsHidden()
            
            VStack(alignment: .leading, spacing: 24) {
                FieldSection(sectionTitle: "User Name",
                             placerHolder: "Enter your user name",
                             inputType: .username,
                             text: $viewModel.auth.userName)
                .focused($isFoucsed)
                FieldSection(sectionTitle: "Password",
                             placerHolder: "Enter your password",
                             inputType: .password,
                             text: $viewModel.auth.password)
                .focused($isFoucsed)
            }
            
            AppActionButton(isLoading: $viewModel.isLoading,
                            isEnabled: $viewModel.isValidToAuth,
                            text: "Sign in") {
                viewModel.authenticate()
                withAnimation(.easeInOut(duration: 0.35)) {
                    isFoucsed = false
                    scrollProxy.scrollTo(1, anchor: UnitPoint(x: 1, y: 10))
                }
            }
                            .id(1)
        }
        .padding(.horizontal, 16)
        .onChange(of: isFoucsed) { isFoucsed in
            guard isFoucsed else { return }
            scrollProxy.scrollTo(1, anchor: UnitPoint(x: 1, y: 1.3))
        }
    }
}

