//
//  PostView.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 10/03/2023.
//

import SwiftUI

struct PostView: View {
    
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Group {
                PostHeader(user: post.user)
                PostBody(postType: post.body)
            }.padding(.horizontal, 16)
            AppDivider()
        }
    }
}
