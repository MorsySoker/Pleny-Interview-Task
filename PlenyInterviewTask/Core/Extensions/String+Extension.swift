//
//  String+Extension.swift
//  SalamtakDr
//
//  Created by Korashi on 06/12/2022.
//

import Foundation

extension String {
    func subString(_ range: ClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return String(self[start...end])
    }
    
    func toDate(withFormat format: String = "dd/MM/yyyy HH:mm:ss")-> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }
}

extension String.Element {
    func isArabic() -> Bool {
        NSRegularExpression.evaluate(character: self, pattern: .arabicCharacter)
    }
}
