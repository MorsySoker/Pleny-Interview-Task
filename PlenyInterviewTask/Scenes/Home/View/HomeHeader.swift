//
//  HomeHeader.swift
//  PlenyInterviewTask
//
//  Created by Morsy Mohamed Elsokary on 09/03/2023.
//

import SwiftUI

struct HomeHeader: View {
    
    //MARK: - View States
    @Binding var searchText: String
    @State private var animateLogo: Bool = false
    @State private var showSearchBar: Bool = false
    @State private var logoWidth: CGFloat = 60
    
    //MARK: - Views
    private var logo: some View {
        Image("appLogo")
            .frame(width: showSearchBar ? 0 : logoWidth)
            .offset(x: animateLogo ? (showSearchBar ? -100 : 16) : -100)
            .animation(.easeInOut(duration: 0.35), value: animateLogo)
    }
    
    //MARK: - Body
    var body: some View {
        HStack(alignment: .center) {
            logo
            CollapsibleSearchBar(searchText: $searchText,
                                 onPressSearch: { showSearchBar.toggle() },
                                 onCancel: {showSearchBar = false})
        }
        .frame(height: 44)
        .padding(.bottom, 8)
        .animation(.easeInOut(duration: 0.35), value: showSearchBar)
        .background(alignment: .bottom) {
            AppDivider()
        }
        .onAppear {
            animateLogo = true
        }
    }
}
