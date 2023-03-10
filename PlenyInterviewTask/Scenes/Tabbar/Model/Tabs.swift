//
//  Tabs.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 08/03/2023.
//

import Foundation

enum Tab: Int, Identifiable, CaseIterable {
    
    case home
    case market
    case offers
    case gallary
    case profile
    
    var id: Int {
        self.rawValue
    }
    
    var icon: String {
        switch self {
        case .home: return "home"
        case .market: return "market"
        case .offers: return "offers"
        case .gallary: return "gallery"
        case .profile: return "profile"
        }
    }
}
