//
//  View+Keyboard.swift
//  PlenyInterviewTask
//
//  Created by Morsy Mohamed Elsokary on 09/03/2023.
//

import SwiftUI

extension View {
    func dismissKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
