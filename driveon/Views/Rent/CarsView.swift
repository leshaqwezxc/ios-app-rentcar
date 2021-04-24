//
//  HomeView.swift
//  driveon
//
//  Created by Алексей Тузовский on 21.03.2021.
//

import SwiftUI

struct CarsView: View {
    
    @ObservedObject var viewModel: CarsViewModel
    @State private var isFilterPresented = false
    init() {
        
        self.viewModel = CarsViewModel()
            UINavigationBar.appearance().largeTitleTextAttributes = [
                .foregroundColor: UIColor(named: "mainColor") ?? .black,
                .font : UIFont(name:"RussoOne-regular", size: 40)!]
                    
            // 3.
            UINavigationBar.appearance().titleTextAttributes = [
                .foregroundColor: UIColor(named: "mainColor") ?? .black,
                .font : UIFont(name: "RussoOne-regular", size: 20)!]

        }
    var body: some View {
        NavigationView{

            ScrollView(.vertical, showsIndicators: true){
                switch viewModel.loadingState {
                case .success, .loading, .none:
                    SearchBar(text: $viewModel.searchText)
                        .padding(.horizontal,20)
                    LazyVStack(alignment:.leading ,spacing: 15){
                        Text("Свободные авто")
                            .font( .title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.horizontal, 20)

                        ForEach(viewModel.searchedCars() ){
                            car in NavigationLink(
                                destination: CarDetailScreen(carId: car.id)){
                                    CarCell(car: car)
                                }

                        }

                    }.redacted(reason:  viewModel.loadingState == .loading ? .placeholder : .init())
                case .failed:
                    FailedView()
                }

            }
                .navigationBarItems(trailing:
                            HStack {
                                Button(action: {
                                    self.isFilterPresented.toggle()
                                }) {
                                    Image(systemName: "slider.horizontal.3")
                                }.foregroundColor(.gray)
                            })
                            .sheet(isPresented: $isFilterPresented){
                                    FilterView(flt: self.$viewModel.filter)
            }
                .navigationBarTitle(Text("drive on"))

        }
        
    }
}


