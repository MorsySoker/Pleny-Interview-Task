//
//  AppDivider.swift
//  PlenyInterviewTask
//
//  Created by MorsyElsokary on 09/03/2023.
//

import SwiftUI

struct AppDivider: View {
    var body: some View {
        Rectangle()
            .fill(Color.appDivider)
            .frame(height: 1)
    }
}

struct AppDivider_Previews: PreviewProvider {
    static var previews: some View {
        AppDivider()
    }
}
