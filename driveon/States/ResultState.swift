//
//  ResultState.swift
//  driveon
//
//  Created by Алексей Тузовский on 21.03.2021.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Car])
    case failed(error: Error)
}
