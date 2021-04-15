//
//  ProfileEditView.swift
//  driveon
//
//  Created by Алексей Тузовский on 05.04.2021.
//

import Foundation


import SwiftUI

struct ProfileEditView: View {
    
    @ObservedObject var viewModel = ProfileViewModel()
    @State var email = ""

    var body: some View {
        Form {
            Section(header: Text("Изменить")) {
                TextField("Телефон", text: $email )
                    .font(.system(size: 16))
            }
            Section(header: Text("Изменить")) {
                TextField("Email", text: $email )
                    .font(.system(size: 16))
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                VStack{
                    
                    Text("Оплатить")
                        .foregroundColor(.white)
                        .font(Font.custom("RussoOne-Regular", size: 20))
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 1)
                )
                .frame(height: 50)
                .background(Color("mainColor"))
                .cornerRadius(10)
                .animation(.linear(duration: 0.3))
                .padding(.vertical, 20)
            })

        }
    }
}

