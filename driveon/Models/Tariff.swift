//
//  Tariff.swift
//  driveon
//
//  Created by Алексей Тузовский on 13.03.2021.
//

import Foundation
struct Tariff: Codable {
    let deposit, for12Days, milage, for37Days: Int
    let from8Days: Int

    enum CodingKeys: String, CodingKey {
        case deposit
        case for12Days = "for1_2days"
        case milage
        case for37Days = "for3_7days"
        case from8Days = "from8days"
    }
}
