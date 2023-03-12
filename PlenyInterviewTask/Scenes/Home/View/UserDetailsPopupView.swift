//
//  UserDetailsPopupView.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 12/03/2023.
//

import SwiftUI

struct UserDetailsPopupView: View {
    var animation: Namespace.ID
    @EnvironmentObject private var userDetailsModel: UserDetailsModel
    var body: some View {
        Image(userDetailsModel.selectedUser.avatar)
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
    }
}
