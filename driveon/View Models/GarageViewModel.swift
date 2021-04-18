//
//  GarageViewModel.swift
//  driveon
//
//  Created by Алексей Тузовский on 05.04.2021.
//

import Foundation
import Combine

class GarageViewModel: ObservableObject {
    @Published var rents: [GarageRent] = [GarageRent]()
    @Published var loadingState = LoadingStates.loading
    var appService = AppSevice()
    
    func getRents(){
        appService.getRentById(userId: AccauntInfo.id, complection: {
            result in
            switch result {
            case .success(let rents):
                    DispatchQueue.main.async {
                        self.rents = rents
                        self.loadingState = .success
                }
            case .failure(let error):
                print("error")
                self.loadingState = .failed
            }
        })
    }
    
}
