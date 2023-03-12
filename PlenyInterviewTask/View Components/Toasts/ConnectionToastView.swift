//
//  ConnectionToastView.swift
//  SalamtakDr
//
//  Created by Korashi on 27/11/2022.
//

import SwiftUI
import SSToastMessage

struct ConnectionToastView: View {
    
    let errorMsg: String
    @Binding var hideToast: Bool
    
    private var content: some View {
        VStack {
            VStack(alignment: .leading) {
                Spacer()
                HStack(spacing: 12) {
                    Image(systemName: "wifi.exclamationmark")
                        .foregroundColor(Color.textColor)
                    
                    Text(errorMsg)
                        .foregroundColor(Color.textColor)
                    
                    Spacer()
                }
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.sfRegular(of: 14))
                .padding(.horizontal, 16)
            }
            .frame(width: UIScreen.main.bounds.width, height: 100)
            .background(Color.appGrayBoarders)
            .opacity(hideToast ? 1 : 0)
        }
    }
    
    var body: some View {
        content
    }
}

extension View {
    func showConnectonToast(isPresented: Binding<Bool>,
                            errorMsg: String,
                            onConnectionRestore: (() -> Void)? = nil) -> some View {
        self
            .present(isPresented: isPresented, type: .toast, position: .top, autohideDuration: nil) {
                ConnectionToastView(errorMsg: errorMsg, hideToast: isPresented)
                    .onChange(of: errorMsg) {
                        if $0.isEmpty {
                            if let onConnectionRestore { onConnectionRestore() }
                        }
                    }
            }
    }
}


