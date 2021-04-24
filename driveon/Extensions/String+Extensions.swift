//
//  String+Extensions.swift
//  driveon
//
//  Created by Алексей Тузовский on 09.04.2021.
//

import Foundation
import SwiftUI
extension String {
    
    func trimmedAndEscaped() -> String {
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self 
    }
}
extension Binding {
    init<T>(isNotNil source: Binding<T?>, defaultValue: T) where Value == Bool {
        self.init(get: { source.wrappedValue != nil },
                  set: { source.wrappedValue = $0 ? defaultValue : nil})
    }
}
