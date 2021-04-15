//
//  MyGarageView.swift
//  driveon
//
//  Created by Алексей Тузовский on 26.03.2021.
//

import SwiftUI
import Kingfisher

struct MyGarageView: View {
    
    var rent: Rent

    var body: some View {
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/){
                    Text("\(rent.car.carbrand) \(rent.car.model)")
                        .font(.system(size: 30))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal, 20)
                    KFImage(URL(string: "http://192.168.0.10:3000/\(rent.car.carimg)"))
                        .resizable()
                        .scaledToFill()
                        .padding(.top, 40)
                        .padding(.horizontal, 10)
                    Text("Спецификация")
                        .fontWeight(.semibold)
                        .font(.system(size: 22))
                        .padding(.horizontal,20)
                        .frame(width: 400, alignment: .leading)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            VStack(alignment: .leading){
                                Text("Цвет")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 2)
                                Text("\(rent.car.color)")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(
                                        Color.gray, lineWidth: 1)
                            )
                            VStack(alignment: .leading){
                                Text("Трансмиссия")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 2)
                                Text("Автоматическая")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(
                                        Color.gray, lineWidth: 1)
                            )
                            VStack(alignment: .leading){
                                Text("Мест")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 2)
                                Text("5")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(
                                        Color.gray, lineWidth: 1)
                            )
                            VStack(alignment: .leading){
                                Text("Класс авто")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 2)
                                Text("D")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(
                                        Color.gray, lineWidth: 1)
                            )
                            VStack(alignment: .leading){
                                Text("Мощность")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 2)
                                Text("250 л.с.")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(
                                        Color.gray, lineWidth: 1)
                            )
                            
                        }
                        .padding(.horizontal)
                        .padding(.vertical,2)
                        
                    }
                    Divider()
                        .padding(.horizontal,20)
                    Text("Номер")
                        .fontWeight(.semibold)
                        .padding(.horizontal,20)
                    Text("К099ОХ198")
                        .padding(.horizontal,20)
                    Divider()
                        .padding(.horizontal,20)
                    Text("VIN")
                        .fontWeight(.semibold)
                        .padding(.horizontal,20)

                    Group{
                        Text("2C4GJ453XYR693697")
                            .padding(.horizontal,20)
                        Divider()
                            .padding(.horizontal,20)
                        HStack{
                            VStack(alignment: .leading){
                                Text("Авто забронировано с ")
                                    .fontWeight(.semibold)
                                    .padding(.horizontal,20)
                                    .padding(.bottom,5)
                                Text("01/03/2021")
                                    .padding(.horizontal,20)
                            }
                            Spacer()
                            VStack(alignment: .leading){
                                Text("до")
                                    .fontWeight(.semibold)
                                    .padding(.horizontal,20)
                                    .padding(.bottom,5)
                                Text("04/03/2021")
                                    .padding(.horizontal,20)
                                
                            }
                        }
                        Divider()
                            .padding(.horizontal,20)
                        Button(action: {
                            
                        }, label: {
                            
                            VStack{
                                
                                Text("Сообщить о поломке/ДТП")
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
                        .padding(.horizontal,20)

                    }
                }.navigationBarTitle(Text("Мой гараж"))

       
    }
}
