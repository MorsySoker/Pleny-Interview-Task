//
//  Fonts+Extensions.swift
//  SalamtakDr
//
//  Created by Korashi on 24/11/2022.
//

import SwiftUI

extension Font {
    
    static func salamtakBlack(of size: CGFloat) -> Self {
        Font.custom("Avenir-Black", size: size)
    }
    
    static func salamtakBlackOblique(of size: CGFloat) -> Self {
        Font.custom("Avenir-BlackOblique", size: size)
    }
    
    static func salamtakMedium(of size: CGFloat) -> Self {
        Font.custom("Avenir-Medium", size: size)
    }
    
    static func salamtakBook(of size: CGFloat) -> Self {
        Font.custom("Avenir-Book", size: size)
    }
    
    static func salamtakHeavy(of size: CGFloat) -> Self {
        Font.custom("Avenir-Heavy", size: size)
    }
    
    static func salamtakLight(of size: CGFloat) -> Self {
        Font.custom("Avenir-Light", size: size)
    }
    
    static func salamtakOblique(of size: CGFloat) -> Self {
        Font.custom("Avenir-Oblique", size: size)
    }
}
