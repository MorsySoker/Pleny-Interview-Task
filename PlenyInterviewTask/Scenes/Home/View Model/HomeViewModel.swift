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
    @Published var searchText: String = ""
    @Published var depouncedSearchText: String = ""
    // handling infinty scrolling
    @Published var currentPage: Int = 0
    
    private let postService: PostServiceProtocol
    private let userService: UserServiceProtocol
    
    init(postService: PostServiceProtocol,
         userService: UserServiceProtocol) {
        self.postService = postService
        self.userService = userService
        super.init()
        self.depounceSearchText(for: 1)
    }
}
 
extension HomeViewModel {
    private func depounceSearchText(for sec: Int) {
        $searchText
            .drop(while: { $0.isEmpty })
            .debounce(for: .seconds(sec), scheduler: RunLoop.main)
            .sink { searchText in
                self.resetPagination()
                self.loadSearchedPosts()
            }
            .store(in: &cancellables)
    }
}

extension HomeViewModel {
    func loadSearchedPosts() {
        guard !self.isLoading, !searchText.isEmpty else { return }
        self.isLoading = true
        
        postService.getSearchedPosts(with: searchText, limit: 10, skip: currentPage)
            .handleEvents(receiveOutput: handelRecivedOutput)
            .flatMap(convertFeedResponseToPosts)
            .sink(receiveCompletion: onReceive, receiveValue: onReceive)
            .store(in: &cancellables)
    }
    
    func loadPosts() {
        guard !self.isLoading else { return }
        self.isLoading = true
        postService.getPosts(with: 10, skip: currentPage)
            .handleEvents(receiveOutput: handelRecivedOutput)
            .flatMap(convertFeedResponseToPosts)
            .sink(receiveCompletion: onReceive, receiveValue: onReceive)
            .store(in: &cancellables)
    }
    
    func loadMorePosts(currentPost post: Post?) {
        guard let post else {
//            searchText.isEmpty ? loadPosts() : loadSearchedPosts()
            return
        }
        
        let thresholdIndex = posts.index(posts.endIndex, offsetBy: posts.count <= 5 ? 0 : -2)
        print("PostsCount: \(posts.count) index: \(thresholdIndex)")
        
        if posts.firstIndex(where: { $0.id == post.id }) == thresholdIndex {
            searchText.isEmpty ? loadPosts() : loadSearchedPosts()
         }
    }
    
    func resetPagination() {
        self.currentPage = 0
        self.posts = []
    }
}


extension HomeViewModel {
    
    private func handelRecivedOutput(_ response: FeedResponse) {
        self.currentPage += 10
        self.isLoading = false
    }
    
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
            .removeDuplicates(by: { $0.1 == $1.1 })
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
                    self.posts.append(Post(id: post.id,
                                           body: PostType.randomType(body: post.body!),
                                           sender: user))
                }
                .store(in: &self.cancellables)
        }
        
    }
    
    // second way is to get the feed directily
    
    private func convertToFeedResponseToFeed(_ response: FeedResponse) -> AnyPublisher<Feed, NetworkError> {
        
        guard let posts = response.posts else {
            return Fail(error: NetworkError.invalidJSON("")).eraseToAnyPublisher()
        }
        let newPosts: Array<Post> = []
        
        posts.forEach { [weak self] post in
            self?.userService.getUser(withId: post.userID!)
                .sink(receiveCompletion: onReceive, receiveValue: { [weak self] user in
                    self?.posts.append(Post(id: post.id, body: .text(body: post.body!), sender: user))
                })
                .store(in: &cancellables)
        }
        let feed = Feed(posts: newPosts, total: response.total!, skip: response.skip!, limit: response.limit!)
        let feedPublisher = Just(feed).setFailureType(to: NetworkError.self)
        return feedPublisher.eraseToAnyPublisher()
    }
    
    private func onReceive(_ response: Feed) {
        self.isLoading = false
        self.posts = response.posts
    }
}
