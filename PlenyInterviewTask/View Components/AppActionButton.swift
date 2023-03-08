//
//  AppActionButton.swift
//  SalamTak-DR
//
//  Created by Korashi on 08/11/2022.
//

import SwiftUI


struct AppActionButton: View {
    
    @Binding var isLoading: Bool
    @Binding var isEnabled: Bool
    let text: String
    var color: Color = .white
    var backgroundColor: Color = .appBlue
    var font: Font = .sfSemiBold(of: 17)
    var isFullWidth: Bool = true
    var horizontalPadding: CGFloat = 12
    var verticalPadding: CGFloat = 12
    var height: CGFloat = 46
    var cornerRadius: CGFloat = 32
    let action: () -> ()
    
    var body: some View {
        Button { if !isLoading { action() } } label: {
            HStack {
                if isFullWidth {
                    Spacer()
                }
                
                if isLoading {
                    LoadingIndicator(width: 15, height: 15, trimTo: 0.7, color: .white)
                } else {
                    Text(text)
                        .font(font)
                        .foregroundColor(color)
                        .padding(.vertical, verticalPadding)
                }
                
                if isFullWidth {
                    Spacer()
                }
            }
            .frame(height: height)
            .background(isEnabled ? backgroundColor : Color(uiColor: .systemGray2))
            .cornerRadius(cornerRadius)
        }
        .disabled(!isEnabled || isLoading)
    }
}
