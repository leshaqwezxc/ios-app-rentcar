import Foundation

struct CarsResponse: Codable{
    let car: [Car]
}
struct RentDates: Codable {
    var dateBegin: Date
    var dateEnd: Date
}

struct Car: Codable, Identifiable{
    var id: Int
    var carbrand, model, color, year: String
    var transmission: String
    var seats, power: Double
    var carclass, carimg, statenum: String
    var vin, caraccesscode: Int
    var tariffID, branchID: Int
    var tariff: Tariff
    var branch: Branch
    var dates: [RentDates] = [RentDates]()

    enum CodingKeys: String, CodingKey {
        case id, carbrand, model, color, year, transmission, seats, power, carclass, carimg, statenum, vin, caraccesscode
        case tariffID = "tariffId"
        case branchID = "branchId"
        case tariff
        case branch
    }
    mutating func addDates(rents: [Rent]) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        for rent in rents {
            if rent.carID == id {
               // dates.append(formatter.date(from: rent.end) ?? Date())
                dates.append(RentDates(dateBegin: formatter.date(from: rent.start) ?? Date(), dateEnd: formatter.date(from: rent.end) ?? Date()))
                //print(dates)
            }
        }
    }
}

extension Car {
    static var dummyCar: Car {
        .init(id: 1, carbrand: "Tayota", model: "Camry", color: "Black", year: "2020", transmission: "Automatic", seats: 5, power: 180, carclass: "D", carimg: "c7c0704c-e2c3-49ac-ab20-4af9c9c80902.png", statenum: "1234", vin: 124, caraccesscode: 1, tariffID: 1, branchID: 1, tariff: Tariff(deposit: 12, for12Days: 1, milage: 1, for37Days: 1, from8Days: 1), branch:Branch(id: 1, city: "Москва", phone: "", email: "", address: ""))
    }
}

struct FilterCar: Hashable {
    var sortNumber: Int? = 0
    var seats: Double = 2.0
    var carClass: [ParametrItem] = []
    var transmission: [ParametrItem] = []
    var price: ClosedRange<Double>
    var cities: [ParametrItem]
    var dateBegin : Date?
    var dateEnd : Date?
    
    mutating func clearAll() {
        seats = 2.0
        price = 0.1...1.0
        dateBegin = nil
        dateEnd = nil
        if !carClass.isEmpty {
            for i in 0...carClass.count - 1 {
                carClass[i].isSelected = false
            }
        }
        if !transmission.isEmpty {
            for i in 0...transmission.count - 1 {
                transmission[i].isSelected = false
            }
        }

        if !cities.isEmpty {
            for i in 0...cities.count - 1 {
                cities[i].isSelected = false
            }
        }

        
        
    }
}
struct ParametrItem: Hashable {
    var name: String
    var isSelected: Bool
}

//let MOCK_CARTEST: [Car] = [
//    .init(id: 1, carBrand: "Tayota", model: "Camry", color: "Black", year: "2020", transmission: "Automatic", seats: 5, power: 180, carClass: "D", carImg: "c7c0704c-e2c3-49ac-ab20-4af9c9c80902.png", stateNum: "1234", vin: 124, carAccessCode: 1, tariffID: 1, branchID: 1, tariff: Tariff(deposit: 12, for12Days: 1, milage: 1, for37Days: 1, from8Days: 1))
//]
