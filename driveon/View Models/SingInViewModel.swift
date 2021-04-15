//
//  SingInViewModel.swift
//  driveon
//
//  Created by Алексей Тузовский on 05.04.2021.
//

import Foundation
import Combine


class SingInViewModel: ObservableObject {
    @Published var user: User
    let appService = AppSevice()
    @Published var loadingState = LoadingStates.loading
    @Published var errorMessage = ""
    @Published var isCorrect = false
    init(user: User = User(user: UserInfo(id: 0, email: "", password: ""), token: "")) {
        self.user = user
    }
    
    func login(userEmail:String, userPassword: String){
        appService.login(userEmail: userEmail, userPassword: userPassword, complection: {
            result in
            switch result {
            case .success(let user):
                    DispatchQueue.main.async {
                        self.user = user
                        self.loadingState = .success
                        AccauntInfo.id = user.user.id
                        AccauntInfo.token = user.token
                        self.isCorrect = true
                    }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = "Неверный логин или пароль"
                    self.loadingState = .failed
                }
            }
        })
    }
}
