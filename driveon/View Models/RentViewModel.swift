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
    @Published var adds: [ParametrItem] = [ParametrItem(name: "Страховка", isSelected: false),
    ParametrItem(name: "Парковка", isSelected: false)]
    
    var isFileldFull: Bool {
        return Rentdate1 != nil && Rentdate2 != nil
    }
    
}
