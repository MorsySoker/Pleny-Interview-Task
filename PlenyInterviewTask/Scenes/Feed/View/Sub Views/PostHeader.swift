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

    private var avatar: some View {
        
        Image(user.avatar!)
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
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

struct PostHeader_Previews: PreviewProvider {
    static var previews: some View {
        PostHeader(user: .init(id: 1,
                               name: "Morsy Mohamed Morsy",
                               avatar: "malePic"))
        .padding(.horizontal, 16)
    }
}
