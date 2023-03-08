//
//  Fonts+Extensions.swift
//  SalamtakDr
//
//  Created by Korashi on 24/11/2022.
//

import SwiftUI

extension Font {
    
    static func sfBold(of size: CGFloat) -> Self {
        Font.custom("SFProDisplay-Bold", size: size)
    }
    
    static func sfSemiBold(of size: CGFloat) -> Self {
        Font.custom("SFProDisplay-Semibold", size: size)
    }
    
    static func sfMedium(of size: CGFloat) -> Self {
        Font.custom("SFProDisplay-Medium", size: size)
    }
    
    static func sfRegular(of size: CGFloat) -> Self {
        Font.custom("SFProDisplay-Regular", size: size)
    }
}
