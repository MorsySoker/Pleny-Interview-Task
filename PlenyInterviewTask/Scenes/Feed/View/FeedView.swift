//
//  FeedView.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 09/03/2023.
//

import SwiftUI

struct FeedView: View {
    
    //MARK: - View States
    @ObservedObject var viewModel: HomeViewModel
    
    //MARK: - Views
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 12) {
                ForEach(viewModel.posts) { post in
                    PostView(post: post)
                        .onAppear {
                            viewModel.loadMorePosts(currentPost: post)
                        }
                }
            }
        }
        .overlay(alignment: .center, content: {
            if viewModel.isLoading {
                ProgressView()
            }
        })
        // pull to refresh
        .refreshable {
            viewModel.resetPagination()
            viewModel.loadPosts()
        }
        .onTapGesture {
            dismissKeyboard()
        }
    }
}
