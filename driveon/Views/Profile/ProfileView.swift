//
//  ProfileView.swift
//  driveon
//
//  Created by Алексей Тузовский on 27.03.2021.
//

import SwiftUI

struct ProfileView: View {
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
            ScrollView{
                VStack(alignment: .leading){
                    Text("Алексей Тузовский")
                    Divider()
                    Text("Email")
                    Text("leshaqwezxc@gmail.com")
                    Divider()
                    Text("Номер телефона")
                    Text("+7(981)971-56-28")
                    Divider()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("История аренды")
                    })
                    Spacer()
                    
                }
                .padding(.horizontal, 20)
            }

            .navigationBarItems(trailing:
                        HStack {
                            Button(action: {}) {
                                Image(systemName: "pencil.circle")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            }.foregroundColor(Color("mainColor"))
                        })
            .navigationBarTitle(Text("Профиль"))
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
