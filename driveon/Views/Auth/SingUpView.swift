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
    @ObservedObject var viewModel = SingUpViewModel()
    @State var currentImage = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader{reader in
            ScrollView{
                VStack{
                    HStack{
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "chevron.left")
                                .font(.title)
                        })
                        Spacer()
                    }
                    .padding()
                    Group{
                        Image("logo2")
                            .resizable()
                            .frame(width: 262, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.top, 50)
                        Text("Регистрация")
                            .font(Font.custom("RussoOne-Regular", size: 36))
                        TextField("Фамилия", text:$viewModel.registrationUserModel.lastName)
                            .padding(.leading, 25)
                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .frame( height: 60)
                        Divider()
                            .padding(.horizontal, 25)
                        TextField("Имя", text:$viewModel.registrationUserModel.firstName)
                            .padding(.leading, 25)
                            .frame(height: 60, alignment: .center)
                        Divider()
                            .padding(.horizontal, 25)

                    }
                    TextField("Отчество", text:$viewModel.registrationUserModel.patronymic)
                        .padding(.leading, 25)
                        .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Divider()
                        .padding(.horizontal, 25)
                    TextField("Электронная почта", text:$viewModel.registrationUserModel.email)
                        .padding(.leading, 25)
                        .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Group{
                        Divider()
                            .padding(.horizontal, 25)
                        TextField("Телефон", text:$viewModel.registrationUserModel.phone)
                            .padding(.leading, 25)
                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Divider()
                            .padding(.horizontal, 25)
                        
                        HStack{
                            VStack(){
                                if self.visible{
                                    TextField("Пароль", text: $viewModel.registrationUserModel.password)
                                        .padding(.leading, 25)
                                        .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                } else {
                                    SecureField("Пароль", text: $viewModel.registrationUserModel.password)
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
                        
                        DatePicker("Дата рождения", selection: $viewModel.dateBirth, in:...Date(), displayedComponents: .date)
                            .padding(.horizontal, 20)
                            .frame( height: 60)
                        Divider()
                            .padding(.horizontal, 25)
                        TextField("Номер прав", text:$viewModel.registrationUserModel.driveLicense)
                            .padding(.leading, 25)
                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Divider()
                            .padding(.horizontal, 25)
                        Group{
                            DatePicker("Дата выдачи прав", selection: $viewModel.dateofissue, in:...Date(), displayedComponents: .date)
                                .frame( height: 60)
                                .padding(.horizontal, 20)
                            Divider()
                                .padding(.horizontal, 25)
                            TextField("Паспорт", text:$fam)
                                .padding(.leading, 25)
                                .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Divider()
                                .padding(.horizontal, 25)


                            
                            
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2),spacing: 20, content: {
                                
                                ForEach(viewModel.images.indices,id: \.self){index in
                                    
                                    ZStack{
                                        
                                        if viewModel.images[index].count == 0{
                                            Image(systemName: "person.badge.plus")
                                                .font(.system(size: 45))
                                                .foregroundColor(Color("mainColor"))
                                        }
                                        else{
                                            Image(uiImage: UIImage(data: viewModel.images[index])!)
                                                .resizable()
                                                .scaledToFit()
                                        }
                                    }
                                    .frame(width: (reader.frame(in: .global).width - 15) / 2, height: (reader.frame(in: .global).height - 20) / 4)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
                                    .onTapGesture {
                                        
                                        // Image Picker...
                                        currentImage = index
                                        viewModel.picker.toggle()
                                    }
                                }
                            })
                            .padding(.top)
                            .padding(.bottom,30)
                            
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
                            .disabled(!viewModel.isValid)
                            .opacity(viewModel.isValid == true ? 1.0 : 0.45)
                            
                        }
                        
                        
                        
                    }
                    
                    
                }
            }
        }
        .sheet(isPresented: $viewModel.picker, content: {
            
            ImagePicker(show: $viewModel.picker, ImageData: $viewModel.images[currentImage])
        })
    }
}

struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SingUpView()
    }
}
