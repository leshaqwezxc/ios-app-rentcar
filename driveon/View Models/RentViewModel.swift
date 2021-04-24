//
//  RentViewModel.swift
//  driveon
//
//  Created by Алексей Тузовский on 05.04.2021.
//

import Foundation
import Combine
import SwiftUI
class RentViewModel: ObservableObject {
   // @Published var car: Car = Car
    @Published var Rentdate1 = Date()
    @Published var Rentdate2 = Date()
    @Published var loadingState = LoadingStates.loading
    @Published var adds: [ParametrItem] = [ParametrItem(name: "Страховка", isSelected: false),
    ParametrItem(name: "Парковка", isSelected: false)]
    var appService = AppSevice()
    
    var isDateValid: Bool {
        return  Rentdate2 > Rentdate1
    }
    var price: Int {
        Calendar.current.dateComponents([.day], from: Rentdate1, to: Rentdate2).day!
    }
    func rent() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        print(formatter.string(from: Rentdate1))
        
        let rent = Rent(start: formatter.string(from: Rentdate1), end: formatter.string(from: Rentdate2), getPlace: "123", returnPlace: "123", isReturned: false, paid: true, price: 9000, userID: AccauntInfo.id, carID: 5)
        appService.rentCar(rent: rent, complection: {
            result in
            switch result {
            case .success(let details):
                DispatchQueue.main.async {
                    self.loadingState = .success
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
