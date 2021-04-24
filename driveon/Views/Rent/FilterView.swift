//
//  FilterView.swift
//  driveon
//
//  Created by Алексей Тузовский on 29.03.2021.
//

import SwiftUI
import Sliders

struct FilterButtonWithIcon: View {
    @Binding var parametr: ParametrItem
    let image: String
    let iconColor: Color
    @State var isSelected: Bool = false
    @State var strokeColor = Color.gray
    var body: some View {
        Button( action:{
            parametr.isSelected.toggle()
        }){
            HStack {
                Image(systemName: image)
                    .font(.system(size: 14))
                    .foregroundColor(parametr.isSelected == false ? iconColor : Color.white)
                
                Text(parametr.name)
                    .font(.system(size: 14))
            }
        }
        
        .padding(10)
        .padding(.horizontal, 3)
        .padding(.vertical, 2)
        .frame(height: 32)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    parametr.isSelected == false ? Color.gray : iconColor, lineWidth: 1)
        )
        .foregroundColor(parametr.isSelected == false ? .black : .white)
        .background(parametr.isSelected == false ? Color.white : iconColor)
        .cornerRadius(20)
        .animation(.linear)
    }
}

struct ButtonFilterWithoutIcon: View {
//    let name: String
    //@Binding var currentlySelected: [String]
    @Binding var parametr: ParametrItem
    
    @State var isSelected: Bool = false
    var body: some View {
        Button( action:{
            parametr.isSelected.toggle()
//            isSelected.toggle()
//            if isSelected {
//                currentlySelected.append(name)
//            }
//            else {
//                if let index = currentlySelected.firstIndex(of: name){
//                    currentlySelected.remove(at: index)
//                }
//            }
//
//            print(currentlySelected)
        }){
            HStack {
                Text(parametr.name)
                    .font(.system(size: 14))
            }
        }
        
        .padding(10)
        .padding(.horizontal, 3)
        .padding(.vertical, 2)
        .frame(height: 32)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    parametr.isSelected == false ? Color.gray : Color("mainColor"), lineWidth: 1)
        )
        .foregroundColor(parametr.isSelected == false ? .black : .white)
        .background(parametr.isSelected == false ? Color.white : Color("mainColor"))
        .cornerRadius(20)
        .animation(.linear(duration: 0.3))
        
        
    }
}

struct FilterView: View {
    @State var range = 0.1...1
    @State var x = 0.5
    @State var y = 0.5
    @State var cities: [String] = []
    //@State var seats = 4.0
    @Binding var flt: FilterCar
    @State var selectedIndex: Int? = 0
    let options: [String] = ["По цене(по возрастнию)", "По цене(по убыванию)","По дате (сначала ближние)", "По количеству мест"]
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView {
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            Text("Сортировка по").font(.system(size: 14)).foregroundColor(.gray).padding(.leading, 12)
                            PickerField("Выберите", data: self.options, selectionIndex: self.$flt.sortNumber).padding(.leading, 12)
                                .frame(height:32)
                        }
                        Text("Город").font(.system(size: 14)).foregroundColor(.gray).padding(.leading, 12)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(){
                                ButtonFilterWithoutIcon(parametr: $flt.cities[0])
                                ButtonFilterWithoutIcon(parametr: $flt.cities[1])
                                ButtonFilterWithoutIcon(parametr: $flt.cities[2])
                                ButtonFilterWithoutIcon(parametr: $flt.cities[3])
                                ButtonFilterWithoutIcon(parametr: $flt.cities[4])
                                ButtonFilterWithoutIcon(parametr: $flt.cities[5])
                                ButtonFilterWithoutIcon(parametr: $flt.cities[6])
                            }.padding(.leading, 12)
                        }
                    }.padding(.vertical, 5)
                    VStack(alignment: .leading){
                        HStack{
                            Text("Количество мест").font(.system(size: 14)).foregroundColor(.gray)
                            Spacer()
                            Text("от \(flt.seats, specifier:"%.0f")")
                        }
                        Slider(value: $flt.seats, in: 2...10, step: 1)
                    }.padding(.horizontal, 12)
                    .padding(.vertical, 5)
                    VStack(alignment: .leading){
                        Text("Трансмиссия").font(.system(size: 14)).foregroundColor(.gray).padding(.leading, 12)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(){
                                ButtonFilterWithoutIcon(parametr: $flt.transmission[0])
                                ButtonFilterWithoutIcon(parametr: $flt.transmission[1])
                                ButtonFilterWithoutIcon(parametr: $flt.transmission[2])
                            }.padding(.leading, 12)
                        }
                    }.padding(.vertical, 5)
                    VStack(alignment: .leading){
                        HStack{
                            Text("Цена").font(.system(size: 14)).foregroundColor(.gray)
                            Spacer()
                            Text("от \(flt.price.lowerBound * 10000, specifier:"%.0f")₽ до \(flt.price.upperBound * 10000, specifier:"%.0f")₽")
                        }
                        RangeSlider(range: $flt.price)
                    }.padding(.horizontal, 12)
                    .padding(.vertical, 5)
                    VStack(alignment: .leading){
                        Text("Класс авто").font(.system(size: 14)).foregroundColor(.gray).padding(.leading, 12)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(){
                                FilterButtonWithIcon(parametr: $flt.carClass[0], image: "b.square.fill",iconColor: Color.blue)
                                FilterButtonWithIcon(parametr: $flt.carClass[1], image: "c.square.fill",iconColor: Color.orange)
                                FilterButtonWithIcon(parametr: $flt.carClass[2], image: "e.square.fill",iconColor: Color.black)
                                FilterButtonWithIcon(parametr: $flt.carClass[3], image: "f.square.fill",iconColor: Color.gray)
                                FilterButtonWithIcon(parametr: $flt.carClass[4], image: "s.square.fill",iconColor: Color.red)
                                FilterButtonWithIcon(parametr: $flt.carClass[5], image: "m.square.fill",iconColor: Color.green)

                            }.padding(.leading, 12)
                        }
                        .navigationBarItems(trailing: Button(action: {flt.clearAll()}, label: {
                            Text("Сбросить все")
                        }))
                    }.padding(.vertical, 5)
                    VStack(alignment: .leading, spacing: 0){
                        Text("Даты аренды").font(.system(size: 14)).foregroundColor(.gray).padding(.leading, 12)
//                        HStack(){

//                            DateField("Введите дату", date: self.$flt.dateBegin)
//                                .padding(.trailing,12)
//                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 35, alignment: .trailing)
//                        }.padding(.vertical, 5)
                        if flt.dateBegin == nil {
                            HStack{
                                Text("Дата начала аренды").padding(.leading, 20)
                                Spacer()
                                Button(action: {
                                    flt.dateBegin = Date()
                                }, label: {
                                    Text("Установить дату")
                                })
                                .padding(.trailing, 20)
                            }
                            .frame( height: 60)

                        } else {
                            DatePicker("Дата начала аренды", selection:  Binding<Date>(get: {self.flt.dateBegin ?? Date()}, set: {self.flt.dateBegin = $0}), displayedComponents: [.date, .hourAndMinute])
                                .opacity(flt.dateBegin == nil ? 0.5 : 1)
                                .frame( height: 60)
                                .padding(.horizontal, 20)
                        }
//                        DatePicker("Дата начала аренды", selection:  Binding<Date>(get: {self.flt.dateBegin ?? Date()}, set: {self.flt.dateBegin = $0}), displayedComponents: .date)
                        
                            
                        Divider().padding(.horizontal, 12)
//                        HStack(){
                            //Text("Дата окончания аренды").padding(.leading, 14)
                            //Spacer()
//                            DateField("Введите дату", date: self.$flt.dateEnd).padding(.trailing,14)
//                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 35, alignment: .trailing)
//                                .foregroundColor(.gray)
//                        }.padding(.vertical, 5)
                        if flt.dateEnd == nil {
                            HStack{
                                Text("Дата окончания аренды").padding(.leading, 20)
                                Spacer()
                                Button(action: {
                                    flt.dateEnd = Date()
                                }, label: {
                                    Text("Установить дату")
                                })
                                .padding(.trailing, 20)
                            }
                            .frame( height: 60)

                        } else {
                            DatePicker("Дата окончания аренды", selection:  Binding<Date>(get: {self.flt.dateEnd ?? Date()}, set: {self.flt.dateEnd = $0}), displayedComponents: [.date, .hourAndMinute])
                                .opacity(flt.dateEnd == nil ? 0.5 : 1)
                                .frame( height: 60)
                                .padding(.horizontal, 20)
                        }
//                        }
                    }.padding(.vertical, 5)
                    .navigationBarItems(leading: Button(action: {
                        self.presentationMode.wrappedValue .dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                    }))
                    
                }
                VStack{
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        //print(flt.dateEnd)
                    }, label: {
                        
                        VStack{
                            
                            Text("Показать")
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
                .navigationBarTitle("Фильтр", displayMode: .inline)

                

            }
            
        }
    }
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView()
//    }
//}
