//
//  CarDetailViewModel.swift
//  driveon
//
//  Created by Алексей Тузовский on 02.04.2021.
//

import SwiftUI

final class CarDetailViewModel: ObservableObject {
    private var carDetail: Car?
    //@Published var car: Car
    @Published var loadingState = LoadingStates.loading
    private var appService = AppSevice()
    let baseURL = "http://localhost:3000/api/cars/"
    //var idCar: Int
    
    init(carDetail: Car? = nil) {
        self.carDetail = carDetail
    }

    func getCarById(carId: Int) {
        appService.getCarById(carId: carId, complection: {
            result in
            switch result {
            case .success(let details):
                DispatchQueue.main.async {
                    self.carDetail = details
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
    
    var carBrand: String {
        self.carDetail?.carbrand ?? ""
    }
    var model: String{
        self.carDetail?.model ?? ""
    }
    var seats: Double{
        self.carDetail?.seats ?? 4
    }
    var carClass: String {
        self.carDetail?.carclass ?? ""
    }
    var carImage: String{
        self.carDetail?.carimg ?? ""
    }
    var color: String{
        self.carDetail?.color ?? ""
    }
    var transmission: String{
        self.carDetail?.transmission ?? ""
    }
    var power: Double{
        self.carDetail?.power ?? 10.0
    }
    var tariff1: Int{
        self.carDetail?.tariff.for12Days ?? 10
    }
    var tariff2: Int{
        self.carDetail?.tariff.for37Days ?? 10
    }
    var tariff3: Int{
        self.carDetail?.tariff.from8Days ?? 10
    }
    var deposit: Int {
        self.carDetail?.tariff.deposit ?? 10
    }
}
