//
//  HomeViewModel.swift
//  driveon
//
//  Created by Алексей Тузовский on 21.03.2021.
//

import Foundation
import Combine



class CarsViewModel: ObservableObject {
    @Published var loadingState: LoadingStates = .none
    @Published var cars = [Car]()
    @Published var rents = [Rent]()
    @Published var searchText = ""
    @Published var navigateToDetail = false
    @Published var carDetailViewModel = CarDetailViewModel()
    @Published var filter = FilterCar(seats: 2.0, carClass: [ParametrItem(name: "Эконом", isSelected: false),
                                                             ParametrItem(name: "Комфорт", isSelected: false),
                                                             ParametrItem(name: "Бизнес", isSelected: false),
                                                             ParametrItem(name: "Внедорожник", isSelected: false),
                                                             ParametrItem(name: "Спорт", isSelected: false),
                                                             ParametrItem(name: "Минивен", isSelected: false)
    ],transmission: [ParametrItem(name: "Механическая", isSelected: false),
                     ParametrItem(name: "Автоматическая", isSelected: false),
                     ParametrItem(name: "Вариаторная", isSelected: false)]
    ,price:0.1...1.0, cities:[ParametrItem(name: "Москва", isSelected: false),
                                      ParametrItem(name: "Санкт-Петербург", isSelected: false),
                                      ParametrItem(name: "Ростов-на-Дону", isSelected: false),
                                      ParametrItem(name: "Сочи", isSelected: false),
                                      ParametrItem(name: "Казань", isSelected: false),
                                      ParametrItem(name: "Екатерингбург", isSelected: false),
                                      ParametrItem(name: "Воронеж", isSelected: false)])
    
    let baseURL = "http://localhost:3000/api/cars"
    let appService = AppSevice()
    
    
    
    func getCars(){
        appService.getCars(complection: {
            result in
            switch result {
            case .success(let cars):
                if let cars = cars {
                    DispatchQueue.main.async {
                        self.cars = cars
                        self.loadingState = .success
                        self.appService.getRents(complection: {
                            result in
                            switch result {
                            case .success(let rents):
                                DispatchQueue.main.async {
                                    self.rents = rents
                                    self.loadingState = .success
                                   self.union()
                                }
                                
                            case .failure(let error):
                                print(error)
                                DispatchQueue.main.async {
                                    self.loadingState = .failed
                                }
                            }
                        })
                    }
                }
            case .failure(let error):
                print("error")
                self.loadingState = .failed
            }
        })
    }
    
    
    init() {
        getCars()
    }
    func check(value: String, array: [ParametrItem]) -> Bool {
        var arrayIsEmpty = false
        for item in array {
            arrayIsEmpty = arrayIsEmpty || item.isSelected
            if item.name == value && item.isSelected == true {
                return true
            }
        }
        return !arrayIsEmpty
    }
    func union(){
        for i in 0...cars.count - 1{
            cars[i].addDates(rents: rents)
            print(cars[i].dates)
        }
    }
    
    func sortCars()->[Car] {
        switch filter.sortNumber{
        case 0:
            return cars.sorted{
                return $0.tariff.for12Days < $1.tariff.for12Days
            }
        case 1:
            return cars.sorted{
                return $0.tariff.for12Days > $1.tariff.for12Days
            }
        case 2:
            return cars.sorted{
                return $0.seats > $1.seats
            }
        case 3:
            return cars.sorted{
                return $0.seats > $1.seats
            }
        case .none:
            return cars.sorted{
                return $0.tariff.for12Days > $1.tariff.for12Days
            }
        case .some(_):
            return cars.sorted{
                return $0.tariff.for12Days > $1.tariff.for12Days
            }
        }
    }
    
    private func containsArray(elem: String,array:[String])-> Bool {
        var result = false
        if array.isEmpty {
            return true
        }
        for a in array {
            if elem == a {
                result = true
            }
        }
        return result
    }
    
    func searchedCars() -> [Car]{
        return filterCars().filter({
            "\($0.carbrand) \($0.model)".contains(searchText.trimmedAndEscaped()) || searchText.isEmpty
        })
    }
    
//    func compareDate(car: Car, dates: Date?) ->Bool {
//        if car.dates.isEmpty || dates == {
//            return true
//        }
//        for i in 0...car.dates.count-1 {
//            if car.dates[i].dateBegin < filter.dateBegin && car.dates[i].dateEnd < filter.dateEnd {
//                
//            }
//        }
//    }
    
    func filterCars() -> [Car] {
        return sortCars().filter({
            return check(value: $0.carclass, array: filter.carClass) &&  $0.seats >= filter.seats && check(value: $0.transmission, array: filter.transmission) && check(value: $0.branch.city, array: filter.cities) && Double($0.tariff.from8Days) >= (filter.price.lowerBound * 10000) && Double($0.tariff.from8Days) <= (filter.price.upperBound * 10000) 
        })
        
    }
    
    func fetchCar() {
        guard let url = URL(string: baseURL) else {
            return
        }
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard let data = data else {
                return
            }
            guard let cars = try? JSONDecoder().decode([Car].self, from: data)
            else {
                return
            }
            
            DispatchQueue.main.async {
                self.cars = cars
            }
        }.resume()
    }
    
}
