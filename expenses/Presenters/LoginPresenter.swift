//
//  LoginPresenter.swift
//  expenses
//
//  Created by Agustin Décima on 20/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation

protocol LoginViewControllerProtocol : class {
    func showError(message: String)
    func showLoginSuccess()
}

class LoginPresenter {
    
    var view : LoginViewControllerProtocol?
    
    let repository = AuthRepository()
    
    init(view: LoginViewControllerProtocol) {
        self.view = view
    }
    
}

extension LoginPresenter : LoginPresenterProtocol {
    
    func login(username: String, password: String) {
        repository.login(username: username, password: password) { (user, error) in
            if let user = user {
                SessionHelper().save(user: user)
                self.view?.showLoginSuccess()
            } else {
                self.view?.showError(message: error ?? "Ocurrió un error")
            }
        }
    }
    
        
    
}