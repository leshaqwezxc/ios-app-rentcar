//
//  HTTPClient.swift
//  driveon
//
//  Created by Алексей Тузовский on 05.03.2021.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}

