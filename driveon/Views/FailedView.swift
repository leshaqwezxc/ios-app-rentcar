//
//  FailedView.swift
//  driveon
//
//  Created by Алексей Тузовский on 09.04.2021.
//

import SwiftUI

struct FailedView: View {
    var body: some View {
        VStack {
            Text("Ошибка подключения!")
                .font(Font.custom("RussoOne-Regular", size: 28))
        }
    }
}

struct FailedView_Previews: PreviewProvider {
    static var previews: some View {
        FailedView()
    }
}
