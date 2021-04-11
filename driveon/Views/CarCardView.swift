//
//  CarCardView.swift
//  driveon
//
//  Created by Алексей Тузовский on 21.03.2021.
//

import SwiftUI
import URLImage

struct CarCardView: View {
    
    let car: Car
    var body: some View {
        HStack {
            if let imgUrl = car.carImg,
               let url = URL(string: "http://localhost:3000/c7c0704c-e2c3-49ac-ab20-4af9c9c80902.png") {

//                URLImage(url: url,
//                         option: URLImageOptions(
//                            identifier: car.id,
//                            cachePolicy:
//                                .returnCacheElseLoad(cacheDelay: nil, downloadDelay: 0.25)
//                         ),
//                         content: {
//                            image in image .resizable()
//                                .aspectRatio(ContentMode: .fill)
//                         })
            } else {
                
            }
        }
    }
}

struct CarCardView_Previews: PreviewProvider {
    static var previews: some View {
        CarCardView(car: Car.dummyCar)
    }
}
