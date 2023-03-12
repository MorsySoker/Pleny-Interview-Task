//
//  PlenyInterviewTaskApp.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 07/03/2023.
//

import SwiftUI

@main
struct PlenyInterviewTaskApp: App {
    
    @StateObject private var appRoot: AppRouter = AppRouter()
    
    var body: some Scene {
        WindowGroup {
            root
                .environmentObject(appRoot)
        }
    }
}

extension PlenyInterviewTaskApp {
     
    @ViewBuilder
    private var root: some View {
        switch appRoot.currentRoot {
        case .auth: LoginView()
        case .tabbar: TabbarView()
        }
    }
}
