//
//  View+NavigationBar.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 07/03/2023.
//

import SwiftUI

extension View {
    func hideNavBar() -> some View {
        self
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}
