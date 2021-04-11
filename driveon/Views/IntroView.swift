//
//  IntroView.swift
//  driveon
//
//  Created by Алексей Тузовский on 22.03.2021.
//

import SwiftUI

struct IntroView: View {
    @State var singInViewIsPresented = false
    @State var singUpIsPresented = false
    var body: some View {
        VStack{
            Image("logo2")
                .resizable()
                .frame(width: 262, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.top, 50)
            
            Text("Сервис по аренде авто")
                .font(Font.custom("RussoOne-Regular", size: 20))
                .padding(.top, 0)
            
            Spacer()
            
            
            VStack(alignment: .leading){
                
                Text("Вы сможете арендовать авто в таких городах как: ")
                    .frame(width: 260, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.leading,25)
                    .padding(.top, 40)
                    .font(.system(size: 18, weight: Font.Weight.semibold, design: Font.Design.default))
                
                ZStack(alignment: .leading){
                    
                    Image("introImg")
                        .resizable()
                        .padding(.trailing, 0)
                        .scaledToFit()
                    
                    VStack(alignment: .leading ){

                        VStack(alignment: .leading, spacing:10){
                                
                                Text("-Москва")
                                    .font(.system(size: 13))
                                Text("-Санкт-Петербург")
                                    .font(.system(size: 13))
                                Text("-Ростов-на-Дону")
                                    .font(.system(size: 13))
                                Text("-Казнь")
                                    .font(.system(size: 13))
                                Text("-Сочи")
                                    .font(.system(size: 13))
                                Text("-Екатеринбург")
                                    .font(.system(size: 13))
                                Text("-Воронеж")
                                    .font(.system(size: 13))
                            }
                            Spacer()

                    }
                    .padding(.leading, 25)
                }
            }
            Spacer()
            
            Button(action: {
                singInViewIsPresented.toggle()
                
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
            .fullScreenCover(isPresented: self.$singInViewIsPresented, content: {
                SingInView()
            })
            
            HStack{
                Text("Нет аккаунта?")
                Button(action: { singUpIsPresented.toggle()}, label: {
                    Text("Создайте аккаунт")
                        .fullScreenCover(isPresented: self.$singUpIsPresented, content: {
                            SingUpView()
                        })
                })
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
