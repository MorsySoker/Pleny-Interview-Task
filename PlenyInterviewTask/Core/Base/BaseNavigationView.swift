//
//  BaseNavigationView.swift
//  SalamtakDr
//
//  Created by MorsyElsokary on 25/11/2022.
//

import SwiftUI

struct BaseNavigationView<Content>: View where Content: View {
    var content: () -> (Content)
    
    var body: some View {
        NavigationView {
            BaseView { content() }
                .hideNavBar()
        }
        
    }
}

struct BaseNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        BaseNavigationView() {
            Text("NavigationView")
        }
    }
}
