//
//  ProfileViewModel.swift
//  driveon
//
//  Created by Алексей Тузовский on 05.04.2021.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var user: UserProfile = UserProfile(id: 2, email: "String", password: "", createdAt: "", updatedAt: "", userInfo: UserProfileInfo(id: 0, firstName: "", lastName: "", patronymic: "", dateOfBirth: "", driveLicense: "", driveLicenseImg: "", passport: "", passportImg: "", phone: "", userPic: "", accessCode: 1, createdAt: "", updatedAt: "", userID: 1))
    @Published var loadingState = LoadingStates.loading
    private var appService = AppSevice()
    
    init() {
        getUser()
    }
    func getUser(){
        appService.getUser(userId: AccauntInfo.id, complection: {
            result in
            switch result {
            case .success(let user):
                    DispatchQueue.main.async {
                        self.user = user
                        self.loadingState = .success
                }
            case .failure(let error):
                print("error")
                self.loadingState = .failed
            }
        })
    }
}
