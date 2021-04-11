//
//  CarCell.swift
//  driveon
//
//  Created by Алексей Тузовский on 28.03.2021.
//

import SwiftUI
import Kingfisher

struct CarCell: View {
     
    let car: Car
    var body: some View {
        VStack{
            HStack(spacing: 0){
                Text("\(car.carbrand)")
                    .foregroundColor(.black)
                    .font(Font.custom("RussoOne-Regular", size: 20))
                    //.fontWeight(.regular)
                    .padding(.leading, 18)
                    .padding(.top, 10)
                    .padding(.bottom, -16)
                Text(" \(car.model)")
                    .foregroundColor(.black)
                    .font(Font.custom("RussoOne-Regular", size: 20))
                    //.fontWeight(.heavy)
                    .padding(.top, 10)
                    .padding(.bottom, -16)
//                Text(" 2020")
//                    .foregroundColor(.gray)
//                    .font(.system(size: 16))
//                    .fontWeight(.bold)
//                    .padding(.top, 10)
//                    .padding(.bottom, -16)
                Spacer()
            }
            KFImage(URL(string: "http://192.168.0.10:3000/\(car.carimg)"))
                .resizable()
                .scaledToFit()
                .frame(width: 337, height: 188, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            HStack(spacing: 0){
                Text("от ")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .padding(.bottom, 10)
                    .padding(.leading, 18)
                Text("" + String(car.tariff.from8Days))
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                    .padding([.trailing,.leading], 0)
                Text(" ₽/сут")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .padding(.bottom, 10)
                    .padding(.trailing, 0)
                Spacer()
                Text("Арендовать")
                    .foregroundColor(Color("mainColor"))
                    .font(Font.custom("RussoOne-Regular", size: 20))
                    .padding([.bottom, .trailing], 10)
                    
            }
        }
        //.background(Color(red: 224/255, green: 229/255, blue: 238/255))
        .background(Color.white)
//        .background(LinearGradient(gradient: Gradient(colors: [.white,.white, Color("backgroundCell")]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(15)
        .shadow(color: .white, radius: 8, x: -8, y: -8)
        .shadow(color: Color(red: 163/255, green: 177/255, blue: 198/255), radius: 8, x: 9, y: 9)
        //.shadow(color: Color.black.opacity(0.25), radius: 6, x: 5.0, y: 6.0)
        .padding(.horizontal, 20)
    }
}

//struct CarCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CarCell(car: MOCK_CARTEST[0])
//    }
//}
