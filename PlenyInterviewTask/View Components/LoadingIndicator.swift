//
//  LoadingIndicator.swift
//  SalamTak-DR
//
//  Created by Korashi on 08/11/2022.
//

import SwiftUI

struct LoadingIndicator: View {
    
    @State private var isLoading = false
    var width: CGFloat
    var height: CGFloat
    var trimTo: CGFloat
    var color: Color
    var lineWidth: CGFloat = 4
    
    var body: some View {
        ZStack{
            Circle()
                .trim(from: 0, to: trimTo)
                .stroke(color, lineWidth: lineWidth)
                .frame(width: width, height: height)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
                .onAppear {
                    self.isLoading.toggle()
                }
        }
    }
}

struct CustomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator(width: 15, height: 15, trimTo: 0.7, color: .green)
    }
}
