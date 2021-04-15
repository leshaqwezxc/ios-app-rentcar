//
//  SingUpView.swift
//  driveon
//
//  Created by Алексей Тузовский on 23.03.2021.
//

import SwiftUI

struct SingUpView: View {
    @State var fam = ""
    @State var name = ""
    @State var oth = ""
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @State var dateofbirth = Date()
    @State var agree = false
    
    var body: some View {
        ScrollView{
            VStack{
                Image("logo2")
                    .resizable()
                    .frame(width: 262, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.top, 50)
                Text("Регистрация")
                    .font(Font.custom("RussoOne-Regular", size: 36))
                TextField("Фамилия", text:$fam)
                    .padding(.leading, 25)
                    .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .frame( height: 60)
                Divider()
                    .padding(.horizontal, 25)
                TextField("Имя", text:$fam)
                    .padding(.leading, 25)
                    .frame(height: 60, alignment: .center)
                Divider()
                    .padding(.horizontal, 25)
                TextField("Отчество", text:$fam)
                    .padding(.leading, 25)
                    .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Divider()
                    .padding(.horizontal, 25)
                TextField("Электронная почта", text:$fam)
                    .padding(.leading, 25)
                    .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Group{
                    Divider()
                        .padding(.horizontal, 25)
                    TextField("Телефон", text:$fam)
                        .padding(.leading, 25)
                        .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Divider()
                        .padding(.horizontal, 25)
                    
                    HStack{
                        VStack(){
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
                        .padding(.horizontal, 25)
                    
                    DatePicker("Дата рождения", selection: $dateofbirth, in:...Date(), displayedComponents: .date)
                        .padding(.horizontal, 20)
                        .frame( height: 60)
                    Divider()
                        .padding(.horizontal, 25)
                    TextField("Номер прав", text:$fam)
                        .padding(.leading, 25)
                        .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Divider()
                        .padding(.horizontal, 25)
                    Group{
                        DatePicker("Дата выдачи прав", selection: $dateofbirth, in:...Date(), displayedComponents: .date)
                            .frame( height: 60)
                            .padding(.horizontal, 20)
                        Divider()
                            .padding(.horizontal, 25)
                        TextField("Паспорт", text:$fam)
                            .padding(.leading, 25)
                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Divider()
                            .padding(.horizontal, 25)
                        Toggle(isOn: $agree){
                            VStack(alignment: .leading){
                                Text("Я принимаю правила")
                                    .foregroundColor(.gray)
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Text("Пользовательского соглашения ").fontWeight(.bold)
                                })
                            }.frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                            
 
                    }.padding(.horizontal, 25)
                        Button(action: {
                            
                        }, label: {
                            
                            VStack{
                                
                                Text("Регистрация")
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

                    }


                    
                }

                
            }
        }
    }
}

struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SingUpView()
    }
}
