//
//  FeedView.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 09/03/2023.
//

import SwiftUI

struct FeedView: View {
    
    //MARK: - View States
    @State private var searchText: String = ""
    
    //MARK: - Views
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            FeedNav(searchText: $searchText)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

struct FeedNav: View {
    
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
            if !showSearchBar {
                Spacer()
                Button { showSearchBar.toggle() } label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .font(.sfSemiBold(of: 20))
                        .foregroundColor(.textColor)
                        .padding(.horizontal, 26)
                }
            } else {
                SearchBar(searchText: $searchText,
                          onCancel: { showSearchBar = false })
                .padding(.horizontal, 12)
            }
            
        }
        .frame(height: 44)
        .padding(.vertical, 12)
        .animation(.easeInOut(duration: 0.35), value: showSearchBar)
        .background(alignment: .bottom) {
            AppDivider()
        }
        .onAppear {
            animateLogo = true
        }
    }
}

struct SearchBar: View {
    
    @Binding var searchText: String
    private let cornerRadius: CGFloat = 8
    @FocusState private var isFocused: Bool
    let onCancel: () -> Void
    
    var body: some View {
        
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading, 10)
                    .foregroundColor(.appBlue)
                TextField("Search", text: $searchText)
                    .foregroundColor(.primary)
                    .padding(.vertical)
                    .focused($isFocused, equals: true)
                
            }
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.appGrayBoarders, lineWidth: 1)
            }
            .overlay {
                HStack {
                    Spacer()
                    Button {
                        searchText = ""
                        onCancel()
                    } label: {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(.red)
                    }
                }
                .padding(.horizontal)
                
            }
        }
        .frame(height: 40)
        .animation(.easeOut(duration: 0.25), value: isFocused)
        .foregroundColor(.gray)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""), onCancel: {})
    }
}
