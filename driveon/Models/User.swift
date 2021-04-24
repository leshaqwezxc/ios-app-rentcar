//
//  User.swift
//  driveon
//
//  Created by Алексей Тузовский on 15.04.2021.
//

import Foundation
// MARK: - User
struct User: Codable {
    let user: UserInfo
    let token: String
}

// MARK: - UserClass
struct UserInfo: Codable {
    let id: Int
    let email, password: String
}

struct RegistationUserModel : Codable {
    var email, password: String
    var firstName, lastName, patronymic: String
    var dateOfBirth: Date
    var driveLicense, passport: String
    var phone: String
    var accessCode: Int
    var dateofissue: Date
    var passportImg,driveLicenseImg, userPic: Data

    enum CodingKeys: String, CodingKey {
        case  firstName, lastName, patronymic, dateOfBirth, driveLicense, driveLicenseImg, passport, passportImg, phone, userPic, accessCode, email, password
        case dateofissue
    }
}

struct UserProfile: Codable {
    let id: Int
    let email, password, createdAt, updatedAt: String
    let userInfo: UserProfileInfo

    enum CodingKeys: String, CodingKey {
        case id, email, password, createdAt, updatedAt
        case userInfo = "user_info"
    }
}

// MARK: - UserInfo
struct UserProfileInfo: Codable {
    let id: Int
    let firstName, lastName, patronymic, dateOfBirth: String
    let driveLicense, driveLicenseImg, passport, passportImg: String
    let phone, userPic: String
    let accessCode: Int
    let createdAt, updatedAt: String
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case id, firstName, lastName, patronymic, dateOfBirth, driveLicense, driveLicenseImg, passport, passportImg, phone, userPic, accessCode, createdAt, updatedAt
        case userID = "userId"
    }
}

