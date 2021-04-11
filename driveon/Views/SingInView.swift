//
//  SingInView.swift
//  driveon
//
//  Created by Алексей Тузовский on 23.03.2021.
//

import SwiftUI

struct SingInView: View {
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @State var isHomeViewPresented = false
    var body: some View {
        VStack{
            Image("logo2")
                .resizable()
                .frame(width: 262, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.top, 50)
            Text("Вход")
                .font(Font.custom("RussoOne-Regular", size: 36))
            Text("Добро пожаловать!")
                .frame(width: 275, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.system(size: 18, weight: Font.Weight.light, design: Font.Design.default))
            Text("Войдите чтобы продолжить")
                .frame(width: 275, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.system(size: 18, weight: Font.Weight.light, design: Font.Design.default))
            TextField("Электронная почта", text:$email)
                .padding(.leading, 25)
                .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Divider()
                .padding(.horizontal,20)
            HStack{
                VStack{
                    if self.visible{
                        TextField("Пароль", text: $pass)
                            .padding(.leading, 25)
                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    } else {
                        SecureField("Пароль", text: $pass)
                            .padding(.leading, 25)
                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
                Button(action: {
                    self.visible.toggle()
                }, label: {
                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(Color("mainColor"))
                        .padding(.trailing, 20)
                })
            }
            Divider()
                .padding(.horizontal,20)
            Spacer()
            Button(action: {
                isHomeViewPresented.toggle()
            }, label: {
                
                VStack{
                    
                    Text("Войти")
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
                .padding(.horizontal, 12)
                .animation(.linear(duration: 0.3))
                .padding(.vertical, 20)
            })
            .fullScreenCover(isPresented: self.$isHomeViewPresented, content: {
                HomeTabBarView()
            })
        }
    }
}

struct SingInView_Previews: PreviewProvider {
    static var previews: some View {
        SingInView()
    }
}
