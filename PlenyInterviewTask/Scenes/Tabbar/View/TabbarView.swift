//
//  TabbarView.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 08/03/2023.
//

import SwiftUI

struct TabbarView: View {
    
    //MARK: - View States
    @State private var selectedTab: Tab = .feed
    
    //MARK: - Views
    @ViewBuilder
    private var page: some View {
        switch selectedTab {
        case .feed: FeedView()
        case .offers: Color.green
        case .market: Color.appBlue
        case .gallary: Color.appBlue
        case .profile: Color.appBlue
        }
    }
    
    private var tabbar: some View {
        VStack(alignment: .center, spacing: 0) {
            Rectangle()
                .fill(Color.appDivider)
                .frame(height: 1)
            HStack(alignment: .center) {
                ForEach(Tab.allCases) {
                    TabView(tab: $0, routerTab: $selectedTab)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            
        }
        .frame(height: 56, alignment: .bottom)
    }
    
    private var content: some View {
        VStack(alignment: .center, spacing: 0) {
            page
            tabbar
        }
    }
    
    //MARK: - Body
    var body: some View {
        content
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
