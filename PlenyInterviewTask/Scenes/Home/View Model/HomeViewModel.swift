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
    private let userService: UserServiceProtocol
    
    init(postService: PostServiceProtocol,
         userService: UserServiceProtocol) {
        self.postService = postService
        self.userService = userService
        super.init()
        self.getPosts()
    }
}

extension HomeViewModel {
    
    func getPosts() {
        postService.getPosts(with: 10, skip: 0)
            .flatMap(convertToFeed)
            .sink(receiveCompletion: onReceive, receiveValue: onReceive)
            .store(in: &cancellables)
    }
    
    private func convertToFeed(_ response: FeedResponse) -> AnyPublisher<Feed, NetworkError> {
        guard let posts = response.posts else {
            return Fail(error: NetworkError.invalidJSON("")).eraseToAnyPublisher()
        }
        var newPosts: Array<Post> = []
        posts.forEach { [weak self] post in
            self?.getUser(withId: post.userID!)
                .sink(receiveCompletion: onReceive, receiveValue: { user in
                    newPosts.append(Post(id: post.id!, body: .text(body: post.body!), sender: user))
                    print("b7bk",newPosts)
                })
                .store(in: &cancellables)
        }
        let feed = Feed(posts: newPosts, total: response.total!, skip: response.skip!, limit: response.limit!)
        let feedPublisher = Just(feed).setFailureType(to: NetworkError.self)
        return feedPublisher.eraseToAnyPublisher()
    }
    
    private func onReceive(_ response: Feed) {
        self.posts = response.posts
        print("$$Posts: \(response)")
    }
}

extension HomeViewModel {
    private func getUser(withId id: Int) -> AnyPublisher<User, NetworkError> {
        userService.getUser(withId: id)
    }
}
