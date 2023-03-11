//
//  HomeView.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 10/03/2023.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - View States
    @StateObject private var viewModel: HomeViewModel
    
    //MARK: - Views
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            HomeHeader(searchText: $viewModel.searchText)
            FeedView(viewModel: viewModel)
        }
    }
    
    //MARK: - init
    init(requestable: Requestable = NetworkRequestable()) {
        _viewModel = StateObject(
            wrappedValue:
                HomeViewModel(postService: PostService(networkService: requestable),
                              userService: UserService(networkService: requestable)))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
