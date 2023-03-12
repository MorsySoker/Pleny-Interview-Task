//
//  UserDetailsModel.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 12/03/2023.
//

import Foundation

final class UserDetailsModel: ObservableObject {
    
    @Published var showUserpic: Bool = false
    //Storing Selected User
    @Published var selectedUser: User!
}
