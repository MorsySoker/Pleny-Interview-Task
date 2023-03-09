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
        case .offers: Color.clear
        case .market: Color.clear
        case .gallary: Color.clear
        case .profile: Color.clear
        }
    }
    
    private var tabbar: some View {
        VStack(alignment: .center, spacing: 0) {
            AppDivider()
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
