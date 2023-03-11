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
            .flatMap(convertFeedResponseToPosts)
            .sink(receiveCompletion: onReceive, receiveValue: onReceive)
            .store(in: &cancellables)
    }
}
extension HomeViewModel {
    
    private func convertFeedResponseToPosts(_ response: FeedResponse) -> AnyPublisher<([AnyPublisher<User, NetworkError>], [PostResponse]), NetworkError> {

        guard let posts = response.posts else {
            return  Fail(error: NetworkError.invalidJSON("")).eraseToAnyPublisher()
        }
        var users: [AnyPublisher<User, NetworkError>] = []

        posts.forEach { [weak self] post in
            let user = self?.userService.getUser(withId: post.userID!)
            users.append(user!)
        }

        return Just((users, posts))
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
    
    private func onReceive(_ response: ([AnyPublisher<User, NetworkError>], [PostResponse])) {
        let usersPub = response.0
        let posts = response.1
        usersPub.forEach { [weak self] userPub in
            guard let self else { return }
            userPub
                .sink(receiveCompletion: self.onReceive) { user in
                    let post = posts.first(where: { $0.userID! == user.id })!
                    self.posts.append(Post(id: post.id!, body: .text(body: post.body!), sender: user))
                }
                .store(in: &self.cancellables)
        }
    }
    
    // second way is to get the feed directily
    
    private func convertToFeedResponseToFeed(_ response: FeedResponse) -> AnyPublisher<Feed, NetworkError> {
        
        guard let posts = response.posts else {
            return Fail(error: NetworkError.invalidJSON("")).eraseToAnyPublisher()
        }
        var newPosts: Array<Post> = []
        
        posts.forEach { [weak self] post in
            self?.userService.getUser(withId: post.userID!)
                .sink(receiveCompletion: onReceive, receiveValue: { [weak self] user in
                    self?.posts.append(Post(id: post.id!, body: .text(body: post.body!), sender: user))
                })
                .store(in: &cancellables)
        }
        let feed = Feed(posts: newPosts, total: response.total!, skip: response.skip!, limit: response.limit!)
        let feedPublisher = Just(feed).setFailureType(to: NetworkError.self)
        return feedPublisher.eraseToAnyPublisher()
    }
    
    private func onReceive(_ response: Feed) {
        self.posts = response.posts
    }
    
}
