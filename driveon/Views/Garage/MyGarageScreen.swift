//
//  MyGarageScreen.swift
//  driveon
//
//  Created by Алексей Тузовский on 15.04.2021.
//

import SwiftUI

struct MyGarageScreen: View {
    @ObservedObject var viewModel = GarageViewModel()
    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        if viewModel.loadingState == .success  {
                            if viewModel.rents.isEmpty {
                                Text("На данный момент вы не арендовали авто")
                                    .foregroundColor(Color("mainColor"))
                                    .font(Font.custom("RussoOne-Regular", size: 30))
                                    .padding()
                            } else {
                                ForEach(viewModel.filteredRents()){
                                    rent in MyGarageView(rent:rent)
                                }
                            }

                            
                        } else if viewModel.loadingState == .failed {
                            FailedView()
                        }
                        
                    }
                    
                }
            }
           
        }
        .onAppear {
            self.viewModel.getRents()
            print(viewModel.loadingState)
        }
    }
}

