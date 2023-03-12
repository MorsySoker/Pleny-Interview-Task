//
//  AppRoot.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 12/03/2023.
//

import Foundation

enum AppRoot {
    case auth
    case tabbar
}

final class AppRouter: ObservableObject {
    
    @Published var currentRoot: AppRoot = .auth
    @Published var isLoggedin: Bool = false
    
    func route() {
        switch (isLoggedin) {
        case (false): currentRoot = .auth
        case (true): currentRoot = .tabbar
        }
    }
}
