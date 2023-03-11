//
//  PostView.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 10/03/2023.
//

import SwiftUI

struct PostView: View {
    
    let post: Post
    @Binding var searchText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Group {
                PostHeader(user: post.user)
                PostBody(postType: post.body, searchText: $searchText)
            }.padding(.horizontal, 16)
            AppDivider()
        }
    }
}
