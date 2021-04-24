//
//  MyGarageView.swift
//  driveon
//
//  Created by Алексей Тузовский on 26.03.2021.
//

import SwiftUI
import Kingfisher

struct CarDetailView: View {
    @ObservedObject var viewModel :CarDetailViewModel
    @State var rentViewIsSelected = false
    var body: some View {

        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/){
                    Text("\(viewModel.carBrand) \(viewModel.model)")
                        .font(Font.custom("RussoOne-Regular", size: 30))
                        .padding(.horizontal, 20)
                    KFImage(URL(string: "http://192.168.0.14:3000/\(viewModel.carImage)"))
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 40)
                        .padding(.horizontal, 10)
                    Text("Тарифы")
                        .fontWeight(.semibold)
                        .font(.system(size: 16))
                        .padding(.horizontal,20)
                        .frame(width: 400, alignment: .leading)
                        .navigationTitle("\(viewModel.model)")
                }
                VStack(alignment: .leading){
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment: .center, spacing: 10){
                            VStack(alignment: .leading){
                                Text("1-2 сут.")
                                    .fontWeight(.semibold)
                                    .padding(.bottom, 5)
                                Text(String(viewModel.tariff1))
                                    .fontWeight(.semibold)
                                    .font(.system(size: 16))
                                Text("₽/сут")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 14))
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(
                                        Color.gray, lineWidth: 1)
                            )
                            VStack(alignment: .leading){
                                Text("3-7 сут.")
                                    .fontWeight(.semibold)
                                    .padding(.bottom, 5)
                                Text(String(viewModel.tariff2))
                                    .fontWeight(.semibold)
                                    .font(.system(size: 16))
                                Text("₽/сут")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 14))
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(
                                        Color.gray, lineWidth: 1)
                            )
                            VStack(alignment: .leading){
                                Text("от 8 сут.")
                                    .fontWeight(.semibold)
                                    .padding(.bottom, 5)
                                Text(String(viewModel.tariff3))
                                    .fontWeight(.semibold)
                                    .font(.system(size: 16))
                                Text("₽/сут")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 14))
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(
                                        Color.gray, lineWidth: 1)
                            )
                            VStack(alignment: .leading){
                                Text("Депозит")
                                    .fontWeight(.semibold)
                                    .padding(.bottom, 5)
                                Text(String(viewModel.deposit))
                                    .fontWeight(.semibold)
                                    .font(.system(size: 16))
                                Text("₽")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 14))
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(
                                        Color.gray, lineWidth: 1)
                            )
                        }
                        .padding(.horizontal,20.0)
                        .padding(.vertical, 5)
                    }

                    Divider()
                        .padding(.horizontal,20)
                    VStack(alignment: .leading){
                        Text("Спецификация")
                            .fontWeight(.semibold)
                            .font(.system(size: 16))
                            .padding(.horizontal,20)
                            .frame(width: 400, alignment: .leading)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                VStack(alignment: .leading){
                                    HStack {
                                        Image("colorcar")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                        Text("Цвет")
                                            .fontWeight(.regular)
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                            .padding(.bottom, 2)
                                    }
                                    Text("\(viewModel.color)")
                                        .fontWeight(.semibold)
                                        .font(.system(size: 16))
                                }
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(
                                            Color.gray, lineWidth: 1)
                                )
                                VStack(alignment: .leading){
                                    HStack {
                                        Image("trns")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                        Text("Трансмиссия")
                                            .fontWeight(.regular)
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                            .padding(.bottom, 2)
                                    }
                                    Text("\(viewModel.transmission)")
                                        .fontWeight(.semibold)
                                        .font(.system(size: 16))
                                }
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(
                                            Color.gray, lineWidth: 1)
                                )
                                VStack(alignment: .leading){
                                    HStack {
                                        Image("seat")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                        Text("Мест")
                                            .fontWeight(.regular)
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                            .padding(.bottom, 2)
                                    }
                                    Text("\(viewModel.seats, specifier: "%.0f")")
                                        .fontWeight(.semibold)
                                        .font(.system(size: 16))
                                }
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(
                                            Color.gray, lineWidth: 1)
                                )
                                VStack(alignment: .leading){
                                    HStack {
                                        Image("classcar")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                        Text("Класс авто")
                                            .fontWeight(.regular)
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                            .padding(.bottom, 2)
                                    }
                                    Text("\(viewModel.carClass)")
                                        .fontWeight(.semibold)
                                        .font(.system(size: 16))
                                }
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(
                                            Color.gray, lineWidth: 1)
                                )
                                VStack(alignment: .leading){
                                    HStack{
                                        Image("powercar")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                        Text("Мощность")
                                            .fontWeight(.regular)
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                            .padding(.bottom, 2)
                                    }

                                    Text("\(viewModel.power, specifier: "%.0f") л.с.")
                                        .fontWeight(.semibold)
                                        .font(.system(size: 16))
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
                        Text("Дополнительно")
                            .fontWeight(.semibold)
                            .font(.system(size: 16))
                            .padding(.horizontal,20)
                            .frame(width: 400, alignment: .leading)
                        Text("Страховка стекол и зеркал")
                            .padding()
                                .frame(height: 32)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(
                                            Color.gray, lineWidth: 1)
                                )
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(20)
                            .padding(.horizontal,20)
                        Text("Страховка стекол и зеркал")
                            .padding()
                                .frame(height: 32)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(
                                            Color.gray, lineWidth: 1)
                                )
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(20)
                            .padding(.horizontal,20)
                        Text("Страховка стекол и зеркал")
                            .padding()
                                .frame(height: 32)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(
                                            Color.gray, lineWidth: 1)
                                )
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(20)
                            .padding(.horizontal,20)
                            .padding(.bottom, 80)
                        
                    }


                }
                .navigationBarTitleDisplayMode(.inline)
            }
            VStack{
                Spacer()
                NavigationLink(
                    destination: RentView()){
                    
                                        VStack{
                    
                                            Text("Оформить")
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
                                    }
//               Button(action: {
//                    self.rentViewIsSelected.toggle()
//                }, label: {
//
//                    VStack{
//
//                        Text("Оформить")
//                            .foregroundColor(.white)
//                            .font(Font.custom("RussoOne-Regular", size: 20))
//                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
//                    .padding(10)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.blue, lineWidth: 1)
//                    )
//                    .frame(height: 50)
//                    .background(Color("mainColor"))
//                    .cornerRadius(10)
//                    .animation(.linear(duration: 0.3))
//                    .padding(.vertical, 20)
//                })
            }
            .padding(.horizontal, 20)
        }

    }
}


