//
//  CarDetailScreen.swift
//  driveon
//
//  Created by Алексей Тузовский on 10.04.2021.
//

import SwiftUI

struct CarDetailScreen: View {
    let carId: Int
    @ObservedObject var viewModel = CarDetailViewModel()
    var body: some View {
        VStack {
            
            if viewModel.loadingState == .loading {
                LoadingView()
            } else if viewModel.loadingState == .success {
                CarDetailView(viewModel: viewModel)
            } else if viewModel.loadingState == .failed {
                FailedView()
            }
            
        }
        
        .onAppear {
            self.viewModel.getCarById(carId: self.carId)
            print(viewModel.loadingState)
        }
    }
}

