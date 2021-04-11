//
//  ViewModelBase.swift
//  driveon
//
//  Created by Алексей Тузовский on 09.04.2021.
//

import Foundation

enum LoadingStates {
    case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingStates = .none
}
