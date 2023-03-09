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
            
            ScrollView(.vertical, showsIndicators: false) {
                
            }
            .onTapGesture {
                dismissKeyboard()
            }
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
