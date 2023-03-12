//
//  PostHeader.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 10/03/2023.
//

import SwiftUI

struct PostHeader: View {
    
    // user model
    let user: User
    var animation: Namespace.ID
    
    @EnvironmentObject private var userDetailsModel: UserDetailsModel

    private var avatar: some View {
        Button {
            withAnimation {
                userDetailsModel.selectedUser = user
                userDetailsModel.showUserpic.toggle()
            }
        } label: {
            Image(user.avatar)
                .resizable()
                .scaledToFill()
                .matchedGeometryEffect(id: user.animationId, in: animation)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
        }
        .buttonStyle(.plain)
    }
    
    private var info: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(user.name)
                .font(.sfSemiBold(of: 17))
                .foregroundColor(.titleColor)
            
            Text("2 days ago")
                .font(.sfRegular(of: 13))
                .foregroundColor(.postDateColor)
        }
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            avatar
            info
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
