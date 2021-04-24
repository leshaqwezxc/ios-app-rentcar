//
//  GarageViewModel.swift
//  driveon
//
//  Created by Алексей Тузовский on 05.04.2021.
//

import Foundation
import Combine
import UIKit

class GarageViewModel: ObservableObject {
    @Published var rents: [GarageRent] = [GarageRent]()
    @Published var loadingState = LoadingStates.loading
    var appService = AppSevice()
    let formatter = DateFormatter()

    
    
    func filteredRents()->[GarageRent] {
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        print(rents[0].end)
        print(formatter.date(from: rents[0].end))
        return rents
        //return rents.filter({ formatter.date(from: $0.end) < Date()})
    }
    
    func getRents(){
        appService.getRentById(userId: AccauntInfo.id, complection: {
            result in
            switch result {
            case .success(let rents):
                    DispatchQueue.main.async {
                        self.rents = rents
                        self.loadingState = .success
                        //print(rents)
                }
            case .failure(let error):
                print("error")
                self.loadingState = .failed
            }
        })
    }
    func callNumber(phoneNumber: String) {
        guard let url = URL(string: "telprompt://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
