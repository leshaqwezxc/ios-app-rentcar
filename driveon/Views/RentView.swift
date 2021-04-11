//
//  RentView.swift
//  driveon
//
//  Created by Алексей Тузовский on 05.04.2021.
//

import SwiftUI
import PassKit

struct ApplePayButton: UIViewRepresentable {
        func updateUIView(_ uiView: PKPaymentButton, context: Context) {
    
        }
        func makeUIView(context: Context) -> PKPaymentButton {
                return PKPaymentButton(paymentButtonType: .plain, paymentButtonStyle: .black)
        }
}
struct ApplePayButtonStyle: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
             return ApplePayButton()
        }
}

struct addsButton: View{
    @Binding var add: ParametrItem
    var body: some View {
        HStack{
            Text(add.name)
                .font(.system(size: 16))
            Spacer()
            Button(action: {
                add.isSelected.toggle()
            }, label: {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(add.isSelected == false ? .gray : Color("mainColor"))
            })
            .animation(.linear(duration: 0.3))
        }
    }

}

struct RentView: View {
    @State var date: Date?
    @State var place = ""
    @State var places = ["Фрунзенская", "Технологический институт"]
    @State var index: Int?
    @State var isAgree = false
    @State var PayViewIsSelected = false
    @State private var selection: String?
    @State var price = 1000
    @State var placeIndex = 0
    @ObservedObject var viewModel = RentViewModel()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    var body: some View {

        
        Form {
            Section(header: Text("Выберите дату")) {
                DatePicker("Начало аренды", selection: $viewModel.Rentdate1, in: Date()...)
                    .font(.system(size: 16))
                DatePicker("Окончание аренды", selection: $viewModel.Rentdate2, in: Date()...)
                    .font(.system(size: 16))
            }
            Text("Машина занята  с 20.01.21 по 22.01.21")
            Section(header: Text("Выберите место получения и возврата")){
                Picker("Место получения", selection: $placeIndex){
                    ForEach(0..<places.count){ index in
                        Text("\(places[index])")
                    }
                }.font(.system(size: 16))

                Picker("Место возврата", selection: $placeIndex){
                    ForEach(0..<places.count){ index in
                        Text("\(places[index])")
                    }.font(.system(size: 16))

                }
               // Picker("Место возврата", selection: $place)
            }
            Section(header: Text("Выберите дополнительные услуги")){

                addsButton(add: $viewModel.adds[0])
                addsButton(add: $viewModel.adds[1])
                
            }
            Toggle(isOn: $isAgree, label: {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Согласен с правилами аренды авто")
                        .underline()
                })
                    .font(.system(size: 16))
            })
            HStack(){
                Text("Итого")
                    .font(.system(size: 16))

                Spacer()
                Text(String(price) + " ₽")
                    .font(.system(size: 14))

            }
//
//            Button( action: {
//                    self.setupPKPaymentRequest()
//            }, label: { Text("")} )
//            .frame(width: 212, height: 38, alignment: .center)
//            .buttonStyle(ApplePayButtonStyle()
            NavigationLink(
                destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                isActive: self.$PayViewIsSelected,
                label: {

                    VStack{

                        Text("Оплатить")
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
                .disabled(viewModel.isFileldFull == false)
            .navigationTitle("Оформление аренды")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RentView_Previews: PreviewProvider {
    static var previews: some View {
        RentView()
    }
}
