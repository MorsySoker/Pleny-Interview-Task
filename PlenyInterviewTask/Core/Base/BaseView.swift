//
//  BaseView.swift
//  SalamtakDr
//
//  Created by Korashi on 24/11/2022.
//

import SwiftUI

struct BaseView<Content>: View where Content: View {
    
    var content: () -> (Content)
    var body: some View {
        ZStack {
            BaseBackgroundView()
            
            content()
                .padding(.horizontal, 16)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView { Text("Base View") }
    }
}
