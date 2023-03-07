//
//  Fonts+Extensions.swift
//  SalamtakDr
//
//  Created by Korashi on 24/11/2022.
//

import SwiftUI

extension Font {
    
    static func sfMedium(of size: CGFloat) -> Self {
        Font.custom("SFPRODISPLAYMEDIUM", size: size)
    }
    
    static func sfBold(of size: CGFloat) -> Self {
        Font.custom("SFPRODISPLAYBOLD", size: size)
    }
    
    static func sfRegular(of size: CGFloat) -> Self {
        Font.custom("SFPRODISPLAYREGULAR", size: size)
    }
}
