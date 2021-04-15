//
//  AboutCompanyView.swift
//  driveon
//
//  Created by Алексей Тузовский on 27.03.2021.
//

import SwiftUI

struct AboutCompanyView: View {
    var body: some View {
        VStack{
            Image("logo2")
                .resizable()
                .frame(width: 262, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.top, 50)
            Text("Компания drive on является лидером в сфере проката легкового транспорта на территории России. Качесвенный сервис и высокий уровень надежности - работаем для Вас! ")
                
        }
    }
}

struct AboutCompanyView_Previews: PreviewProvider {
    static var previews: some View {
        AboutCompanyView()
    }
}
