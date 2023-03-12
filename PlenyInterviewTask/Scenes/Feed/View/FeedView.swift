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
    @EnvironmentObject private var userDetailsModel: UserDetailsModel
    var animation: Namespace.ID
    
    //MARK: - Views
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .center, spacing: 12) {
                ForEach(viewModel.posts) { post in
                    PostView(post: post, animation: animation, searchText: $viewModel.searchText)
                        .onAppear {
                            viewModel.loadMorePosts(currentPost: post)
                        }
                }
            }
        }
        .overlay(alignment: .center, content: {
            if viewModel.isLoading {
                LoadingIndicator(width: 40, height: 40, trimTo: 0.6, color: .textColor, lineWidth: 3)
            }
        })
        // Profile detail popup
        .overlay {
            ZStack(alignment: .top) {
                if userDetailsModel.showUserpic {
                    UserDetailsPopupView(animation: animation)
                }
            }
        }
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
