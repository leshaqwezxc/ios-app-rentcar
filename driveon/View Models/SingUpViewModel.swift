//
//  SingUpViewModel.swift
//  driveon
//
//  Created by Алексей Тузовский on 05.04.2021.
//

import Foundation
import Combine
class SingUpViewModel: NSObject, ObservableObject {
    @Published var registrationUserModel: RegistationUserModel = RegistationUserModel(email: "", password: "", firstName: "", lastName: "", patronymic: "", dateOfBirth: Date(), driveLicense: "", passport: "", phone: "", accessCode: 1, dateofissue: Date(), passportImg: Data(), driveLicenseImg: Data(), userPic: Data())
    @Published var dateBirth: Date = Date()
    @Published var dateofissue: Date = Date()
    @Published var images = Array(repeating: Data(count: 0), count: 3)
    @Published var picker = false
    @Published var isAgree = false
    let appService = AppSevice()

    
    var isValid: Bool {
        registrationUserModel.firstName != "" && registrationUserModel.lastName != ""
    }
    func registration() {
        registrationUserModel.passportImg = images[1]
        registrationUserModel.driveLicenseImg = images[2]
        registrationUserModel.userPic = images[3]
        appService.registration(rum: registrationUserModel, complection: {
            result in
            switch result {
            case .success(let user):
                    DispatchQueue.main.async {
                        print("Ok")
                    }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Bad(")
                }
            }
        })
    }
}
