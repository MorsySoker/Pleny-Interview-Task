//
//  TabView.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 08/03/2023.
//

import SwiftUI

struct TabView: View {
    
    let tab: Tab
    @Binding var routerTab: Tab
    
    var body: some View {
        Button { routerTab = tab } label: {
            VStack(alignment: .center) {
                Image(tab.icon)
                    .foregroundColor(tab == routerTab ? .appBlue : .gray)
            }
            .padding()
            .overlay(alignment: .top) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.appBlue)
                    .frame(width: tab == routerTab ? 12 : 0, height: 2)
            }
        }
        .animation(.easeInOut(duration: 0.35), value: tab == routerTab)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView(tab: .offers, routerTab: .constant(.offers))
    }
}
