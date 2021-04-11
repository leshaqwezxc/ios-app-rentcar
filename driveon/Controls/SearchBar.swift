//
//  SearchBar.swift
//  driveon
//
//  Created by Алексей Тузовский on 31.03.2021.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State var isEditing = false
    
    var body: some View {
        HStack{
            TextField("Поиск",text:$text)
                .padding(15)
                .padding(.horizontal, 20)
                .background(Color(.systemGray6))
                .foregroundColor(.black)
                .cornerRadius(8)
                .overlay(HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                        .padding(.leading, 15)
                    if isEditing {
                        Button(action: {
                            self.text = ""
                        }, label: {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing , 15)
                        })
                    }
                }
                    )
                .onTapGesture {
                    self.isEditing = true
                }
            if isEditing{
                Button(action: {
                    self.isEditing = false
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Отменить")
                })
                .padding(.trailing, 15)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar()
//    }
//}
