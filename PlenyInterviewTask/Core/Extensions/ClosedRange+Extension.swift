//
//  ClosedRange+Extension.swift
//  SalamtakDr
//
//  Created by Korashi on 28/11/2022.
//

import Foundation

extension ClosedRange where Bound == Date {
    func yearsInRange() -> [Int] {
        let calendar = Calendar.current
        let lowerComponents = calendar.dateComponents([.year], from: self.lowerBound)
        let lowerYear = lowerComponents.year ?? 0
        let upperComponents = calendar.dateComponents([.year], from: self.upperBound)
        let upperYear = upperComponents.year ?? 0
        var years = [Int]()
        (lowerYear...upperYear).forEach {
            years.append($0)
        }
        return years
    }
}
