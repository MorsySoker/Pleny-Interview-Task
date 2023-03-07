//
//  Date+Extension.swift
//  SalamtakDr
//
//  Created by MorsyElsokary on 27/11/2022.
//

import Foundation

extension Date {
    static func byAddingYears(_ years: Int) -> Date {
        let date = Calendar.current.date(byAdding: .year, value: years, to: Date()) ?? Date()
        var components = Calendar.current.dateComponents([.day, .month, .year], from: date)
        components.day = 31
        components.month = 12
        return Calendar.current.date(from: components) ?? Date()
    }
    
    var day: Int {
        Calendar.current.dateComponents([.day], from: self).day ?? 0
    }
    
    var month: Int {
        Calendar.current.dateComponents([.month], from: self).month ?? 0
    }
    
    var year: Int {
        Calendar.current.dateComponents([.year], from: self).year ?? 0
    }
    
    var isoDateString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter.string(from: self)
    }
    
    func formatted(withFormat format: String = "MMM d, yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    var isMorning: Bool {
        let hour = Calendar.current.component(.hour, from: self)
        return hour >= 0 && hour < 12
    }
}
