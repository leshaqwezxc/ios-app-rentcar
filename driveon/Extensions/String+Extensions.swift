//
//  String+Extensions.swift
//  driveon
//
//  Created by Алексей Тузовский on 09.04.2021.
//

import Foundation

extension String {
    
    func trimmedAndEscaped() -> String {
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self 
    }
}
