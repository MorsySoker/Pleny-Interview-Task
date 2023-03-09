//
//  Feed.swift
//  PlenyInterviewTask
//
//  Created by Morsy Mohamed Elsokary on 09/03/2023.
//

import Foundation

struct Feed: Identifiable, Codable {
    
    let id: String
    /// posts container
    var posts: Array<Post>
    /// total count of posts
    let total: Int
    /// total skiped posts
    let skip: Int
    /// total count of posts allawed
    let limit: Int
    
    /**
     Creates a feed containing the posts
     
     - Parameter posts: A list of posts.
     - Parameter total: total count of the posts fetched (use limit=0 to get all items).
     - Parameter skip:  you can pass "limit" and "skip" params to limit and skip the results for pagination.
     - Parameter limit:  You can pass "limit" and "skip" params to limit and skip the results for paginatio.
     
     - Returns: A feed initaly empty
     */
    init(posts: Array<Post>, total: Int, skip: Int, limit: Int) {
        self.id = UUID().uuidString
        self.posts = posts
        self.total = total
        self.skip = skip
        self.limit = limit
    }
}
