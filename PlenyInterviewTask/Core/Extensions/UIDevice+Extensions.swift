//
//  Device+Extensions.swift
//  SalamtakDr
//
//  Created by Korashi on 28/12/2022.
//

import UIKit

extension UIDevice {
    var hasNotch: Bool {
        guard #available(iOS 11.0, *), let window = UIApplication.shared.keyWindow else { return false }
        if UIApplication.shared.windowScene?.interfaceOrientation == .portrait {
            return window.safeAreaInsets.top >= 44
        } else {
            return window.safeAreaInsets.left > 0 || window.safeAreaInsets.right > 0
        }
    }
}
