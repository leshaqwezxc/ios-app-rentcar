//
//  AppService.swift
//  driveon
//
//  Created by Алексей Тузовский on 21.03.2021.
//

import Foundation
import Combine


class AppSevice {
    let baseUrl = "http://localhost:3000"
    
    func rentCar(rent: Rent,complection: @escaping (Result<Rent,NetworkError>)-> Void) {
        guard let url = URL(string: "http://localhost:3000/api/rent") else {
            return complection(.failure(.badUrl))
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonData = try? JSONEncoder().encode(rent)
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            guard let data = data, error == nil else {
                return complection(.failure(.noData))
            }
            
            guard let rent = try?  JSONDecoder().decode(Rent.self, from: data) else {
                return complection(.failure(.decodingError ))
            }
            complection(.success(rent))
        }.resume()
    }
    func getRents(complection: @escaping (Result<[Rent],NetworkError>)-> Void) {
        guard let url = URL(string: "http://localhost:3000/api/rent") else {
            return complection(.failure(.badUrl))
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            guard let data = data, error == nil else {
                return complection(.failure(.noData))
            }
            
            guard let rents = try?  JSONDecoder().decode([Rent].self, from: data) else {
                return complection(.failure(.decodingError ))
            }
            complection(.success(rents))
        }.resume()
    }
    func getUser(userId: Int,complection: @escaping (Result<UserProfile,NetworkError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/api/user/\(userId)") else {
            return complection(.failure(.badUrl))
        }
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return complection(.failure(.noData))
            }
            print(String(decoding: data, as: UTF8.self))
            guard let user = try?  JSONDecoder().decode(UserProfile.self, from: data) else {
                return complection(.failure(.decodingError ))
            }
            complection(.success(user))
        }.resume()

    }
    
    func login(userEmail: String, userPassword: String, complection: @escaping (Result<User,NetworkError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/api/user/login") else {
            return complection(.failure(.badUrl))
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters = ["email": userEmail, "password": userPassword]
        do {
              request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
          } catch let error {
              print(error.localizedDescription)
          }
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            guard let data = data, error == nil else {
                return complection(.failure(.noData))
            }
            
            guard let user = try?  JSONDecoder().decode(User.self, from: data) else {
                return complection(.failure(.decodingError ))
            }
            complection(.success(user))
        }.resume()

    }
    
    
    func getRentById(userId: Int, complection: @escaping (Result<[GarageRent],NetworkError>) -> Void ) {
        print(" my user id \(userId)")
        
        guard let url = URL(string: "http://localhost:3000/api/rent/\(userId)") else {
            return complection(.failure(.badUrl))
        }
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data, error == nil else {
                print("noData")
                return complection(.failure(.noData))
            }
            print(String(decoding: data, as: UTF8.self))
            guard let rents = try?  JSONDecoder().decode([GarageRent].self, from: data) else {
                print("decoding")
                return complection(.failure(.decodingError ))
            }
            print(rents)
            complection(.success(rents))
        }.resume()
    }
    
    func getCarById(carId: Int, complection: @escaping (Result<Car,NetworkError>) -> Void) {
        guard let url = URL(string: "\(baseUrl)/api/cars/\(carId)") else {
            return complection(.failure(.badUrl))
        }
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return complection(.failure(.noData))
            }
            
            guard let car = try?  JSONDecoder().decode(Car.self, from: data) else {
                return complection(.failure(.decodingError ))
            }
            print(car)
            complection(.success(car ))
        }.resume()

    }
    
    func getCars(complection: @escaping (Result <[Car]?,NetworkError>) -> Void) {
        guard let url = URL(string: "\(baseUrl)/api/cars") else {
            return complection(.failure(.badUrl))
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(AccauntInfo.token)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            guard let data = data, error == nil else {
                return complection(.failure(.noData))
            }
            
            guard let cars = try?  JSONDecoder().decode([Car].self, from: data) else {
                return complection(.failure(.decodingError ))
            }
            complection(.success(cars))
        }.resume()
    }
}
