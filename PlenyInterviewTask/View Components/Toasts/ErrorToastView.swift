//
//  ErrorToastView.swift
//  SalamTak-DR
//
//  Created by Korashi on 20/11/2022.
//

import SwiftUI
import SSToastMessage

struct ErrorToastView: View {
    let errorMsg: String
    @Binding var hideToast: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack(spacing: 12) {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 18.28)
                
                Text(errorMsg)
                    .font(.sfRegular(of: 17))
                    .foregroundColor(Color.titleColor)
                    .padding(.horizontal)
            }
            .padding(.bottom, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 16)
        .frame(width: UIScreen.main.bounds.width, height: 100)
        .background(Color.appDivider)
        .opacity(hideToast ? 1 : 0)
    }
}

extension View {
    func showErrorToast(isPresented: Binding<Bool>, errorMsg: String) -> some View {
        self
            .present(isPresented: isPresented, type: .toast, position: .top) {
                ErrorToastView(errorMsg: errorMsg, hideToast: isPresented)
            }
    }
}
