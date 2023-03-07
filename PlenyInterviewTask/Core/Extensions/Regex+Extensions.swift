//
//  Regex+Extensions.swift
//  Components
//
//  Created by Korashi on 03/11/2022.
//

import Foundation

enum RegexPattern: String {
    case name = "[a-zA-Z][a-zA-Z0-9\\s]{4,}"
    case email = "^(?![_.-])((?![_.-][_.-])[a-zA-Z\\d_.-]){0,63}[a-zA-Z\\d]@((?!-)((?!--)[a-zA-Z\\d-]){0,63}[a-zA-Z\\d]\\.){1,2}([a-zA-Z]{2,14}\\.)?[a-zA-Z]{2,4}$"
    case password = "^(?=.*[a-z])[\\w~@#$%^&*+=`|{}:;!.?\"()\\[\\]-]{6,32}$"
    case phoneNumber = "^[0][1][0125][0-9]{8}$"
    case arabicCharacter = "[\u{0600}-\u{06FF}\u{0750}-\u{077F}]"
    case none = ""
}

extension NSRegularExpression {
    
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            preconditionFailure("Invalid regular expression: \(pattern)")
        }
    }
    
    func matches(text: String) -> Bool {
        let range = NSRange(location: 0, length: text.count)
        return firstMatch(in: text, range: range) != nil
    }
    
    static func evaluate(text: String, pattern: RegexPattern) -> Bool {
        let regex = NSRegularExpression(pattern.rawValue)
        return regex.matches(text: text)
    }
    
    static func evaluate(character: Character, pattern: RegexPattern) -> Bool {
        NSRegularExpression(pattern.rawValue).matches(text: String(character))
    }
    
    static func evalulate(id: String, birthDate: Date) -> Bool {
        guard id.count >= 14 else { return false }
        let dayFromId = Int(id.subString(5...6)) ?? -1,
            monthFromId = Int(id.subString(3...4)) ?? -1,
            yearFromId = Int(id.subString(1...2)) ?? -1
        return birthDate.day == dayFromId &&
                birthDate.month == monthFromId &&
                birthDate.year % 100 == yearFromId
    }
}
