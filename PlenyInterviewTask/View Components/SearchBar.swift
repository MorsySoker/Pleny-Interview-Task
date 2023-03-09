//
//  SearchBar.swift
//  PlenyInterviewTask
//
//  Created by Morsy Mohamed Elsokary on 09/03/2023.
//

import SwiftUI

struct CollapsibleSearchBar: View {
    
    @Binding var searchText: String
    @State private var collapsed: Bool = true
    @FocusState private var isFocused: Bool
    private let cornerRadius: CGFloat = 8
    let onPressSearch: () -> Void
    let onCancel: () -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                onPressSearch()
                collapsed.toggle()
            } label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: collapsed ? 20 : 17, height: collapsed ? 20 : 17)
                    .font(.sfSemiBold(of: collapsed ? 20 : 2))
                    .foregroundColor(.titleColor)
                    .padding(collapsed ? .trailing : .leading, collapsed ? 13.5 : 10)
                    .frame(alignment: collapsed ? .trailing : .leading)
            }
            
            if !collapsed {
                TextField("Search", text: $searchText)
                    .foregroundColor(.textColor)
                    .padding(.vertical, 9)
                    .focused($isFocused, equals: true)
                    .tint(Color.textColor)
                    .overlay {
                        HStack {
                            Spacer()
                            Button {
                                searchText = ""
                                collapsed = true
                                onCancel()
                            } label: {
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(.appDarkGray)
                                    .font(.sfSemiBold(of: 18))
                            }
                        }
                        .padding(.horizontal)
                    }
            }

        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .background {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(collapsed ? Color.clear : Color.appGrayBoarders, lineWidth: 1)
        }
        .padding(.trailing, collapsed ? 0 : 13.5)
        .animation(.easeInOut(duration: 0.35), value: collapsed)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 24) {
            CollapsibleSearchBar(searchText: .constant(""), onPressSearch: {}, onCancel: {})
        }
        .padding(.horizontal)
    }
}
