//
//  PlenyInterviewTaskApp.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 07/03/2023.
//

import SwiftUI

@main
struct PlenyInterviewTaskApp: App {
    var body: some Scene {
        let text = "Craving something delicious? Try our new dish - a savory mix of roasted vegetables and quinoa, topped with a zesty garlic. Yum!"
        let post1 = Post(id: 1,
                         body: .textWithImages(text, ["foodImage1"]),
                         sender: User(id: 1, name: "Morsy Mohamed", avatar: "malePic"))
        
        let post2 = Post(id: 2,
                         body: .textWithImages(text, ["foodImage1", "foodImage2", "foodImage3", "foodImage4", "foodImage4"]),
                         sender: User(id: 2, name: "Neama Ahmed", avatar: "femalePic"))
        
        let post3 = Post(id: 3,
                         body: .textWithImages(text, ["foodImage4", "foodImage2", "foodImage3"]),
                         sender: User(id: 2, name: "Neama Ahmed", avatar: "femalePic"))
        WindowGroup {
            FeedView(post: [post3, post2])
//            TabbarView()
        }
    }
}
