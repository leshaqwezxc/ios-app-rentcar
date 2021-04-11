//
//  AboutUsView.swift
//  driveon
//
//  Created by Алексей Тузовский on 27.03.2021.
//

import SwiftUI

struct AboutUsView: View {
    init() {
            // 1.

           
            // 2.
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
            List{
                NavigationLink(
                    destination: RulesView(),
                    label: {
                        Text("Правила аренды")
                    })
                NavigationLink(
                    destination: AboutCompanyView(),
                    label: {
                        Text("О компании")
                    })
            }
                .navigationTitle(Text("О нас"))
        }
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
