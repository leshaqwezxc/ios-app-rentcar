//
//  Endpoint.swift
//  driveon
//
//  Created by Алексей Тузовский on 21.03.2021.
//

import Foundation
protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum AppAPI {
    case getCars
}

extension AppAPI: APIBuilder {

    
    var baseUrl: URL {
        switch self {
        case .getCars:
            return URL(string:"http://localhost:3000")!
        }
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
    
    var path: String {
        return "/cars"
    }
}
