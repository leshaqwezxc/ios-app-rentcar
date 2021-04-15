//
//  ProfileView.swift
//  driveon
//
//  Created by Алексей Тузовский on 27.03.2021.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel = ProfileViewModel()
    @State var isEdit = false
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
                        Text("\(viewModel.user.userInfo.lastName) \(viewModel.user.userInfo.firstName) \(viewModel.user.userInfo.patronymic)")
                        Divider()
                        Text("Email")
                        Text("\(viewModel.user.email)")
                        Divider()
                        Text("Номер телефона")
                        Text("\(viewModel.user.userInfo.phone)")
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
                                Button(action: {isEdit.toggle()}) {
                                    Image(systemName: "pencil.circle")
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                }.foregroundColor(Color("mainColor"))
                                .sheet(isPresented: $isEdit, content: {
                                    ProfileEditView()
                                })
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
