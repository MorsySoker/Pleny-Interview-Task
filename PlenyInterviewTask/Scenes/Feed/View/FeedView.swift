//
//  FeedView.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 09/03/2023.
//

import SwiftUI

struct FeedView: View {
    
    //MARK: - View States
    @Binding var searchText: String
    @Binding var post: Array<Post>
    
    //MARK: - Views
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 12) {
                
                ForEach(post) { post in
                    PostView(post: post)
                }
            }
        }
        // pull to refresh
        .refreshable {
            
        }
        .onTapGesture {
            dismissKeyboard()
        }
    }
}
