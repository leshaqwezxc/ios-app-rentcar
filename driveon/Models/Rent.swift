//
//  Rent.swift
//  driveon
//
//  Created by Алексей Тузовский on 15.04.2021.
//

import Foundation
struct Rent: Codable, Identifiable{
    let id: Int
    let start, end, getPlace, returnPlace: String
    let isReturned, paid: Bool
    let price: Int
    let userID, carID: Int
    let car: CarRent

    enum CodingKeys: String, CodingKey {
        case id, start, end, getPlace, returnPlace, isReturned, paid, price
        case userID = "userId"
        case carID = "carId"
        case car
    }
}
struct CarRent: Codable {
    let id: Int
    let carbrand, model, color, year: String
    let transmission: String
    let seats, power: Int
    let carclass, carimg, statenum: String
    let vin, caraccesscode: Int
    let createdAt, updatedAt: String
    let tariffID, branchID: Int

    enum CodingKeys: String, CodingKey {
        case id, carbrand, model, color, year, transmission, seats, power, carclass, carimg, statenum, vin, caraccesscode, createdAt, updatedAt
        case tariffID = "tariffId"
        case branchID = "branchId"
    }
}
