//
//  Binding+Extensions.swift
//  SalamtakDr
//
//  Created by Korashi on 09/01/2023.
//

import SwiftUI

extension Binding where Value == Int {
    func stringify() -> Binding<String> {
        Binding<String>(
            get: { self.wrappedValue > 0 ? String(self.wrappedValue) : "" },
            set: { self.wrappedValue = Int($0) ?? 0 }
        )
    }
}

extension Binding where Value == Double {
    func stringify() -> Binding<String> {
        Binding<String>(
            get: { self.wrappedValue > 0 ? String(self.wrappedValue) : "" },
            set: { self.wrappedValue = (NumberFormatter().number(from: $0)?.doubleValue) ?? Double(0) }
        )
    }
}
