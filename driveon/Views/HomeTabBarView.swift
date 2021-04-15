//
//  HomeTabBarView.swift
//  driveon
//
//  Created by Алексей Тузовский on 27.03.2021.
//

import SwiftUI

struct HomeTabBarView: View {
    @State var selectedView = 1
    var body: some View {
        TabView (selection: $selectedView){
            CarsView()
                .tag(1)
                .tabItem {
                    Image( systemName: "car.2.fill")
                    Text("Аренда")
                }
            MyGarageScreen()
                .tabItem{
                    Image("garage")
                    Text("Гараж")
                }
                .tag(2)
            
           AboutUsView()
                .tabItem{
                    Image( systemName: "info.circle.fill")
                    Text("О нас")
                }
                .tag(3)
            ProfileView()
                .tabItem{
                    Image( systemName: "person.fill")
                    Text("Профиль")
            }.tag(4)
        }.accentColor(Color("mainColor"))
        }
    
}

struct HomeTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabBarView()
    }
}
