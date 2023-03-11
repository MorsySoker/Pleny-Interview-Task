//
//  HomeViewModel.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 10/03/2023.
//

import Foundation
import Combine

final class HomeViewModel: BaseObservableViewModel {
    
    @Published var posts: Array<Post> = []
    
    private let postService: PostServiceProtocol
    
    init(postService: PostServiceProtocol) {
        self.postService = postService
        super.init()
        self.getPosts()
    }
}

extension HomeViewModel {
    
    func getPosts() {
        postService.getPosts(with: 10, skip: 0)
//            .flatMap(convertToFeed)
            .sink(receiveCompletion: onReceive, receiveValue: onReceive)
            .store(in: &cancellables)
    }
    
//    private func convertToFeed(_ transform: FeedResponse) -> AnyPublisher<Feed, NetworkError> {
//
//        return
//    }
    
    private func onReceive(_ response: FeedResponse) {
        guard let posts = response.posts else {
            return
        }
    }
}
