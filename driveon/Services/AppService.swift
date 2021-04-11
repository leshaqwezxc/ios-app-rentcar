//
//  AppService.swift
//  driveon
//
//  Created by Алексей Тузовский on 21.03.2021.
//

import Foundation
import Combine


class AppSevice {
    
    func getCarById(carId: Int, complection: @escaping (Result<Car,NetworkError>) -> Void) {
        guard let url = URL(string: "http://192.168.0.10:3000/api/cars/\(carId)") else {
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
        guard let url = URL(string: "http://192.168.0.10:3000/api/cars") else {
            return complection(.failure(.badUrl))
        }
        URLSession.shared.dataTask(with: url) {
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
