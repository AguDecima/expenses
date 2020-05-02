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
        
        // VALIDATIONS
        guard validateInputs(username, password) else { return }
        
        repository.login(username: username, password: password) { (user, error) in
            if let user = user {
                SessionHelper().save(user: user)
                self.view?.showLoginSuccess()
            } else {
                self.view?.showError(message: error ?? "Ocurrió un error")
            }
        }
    }
    
    func validateInputs(_ username : String? ,_ password : String?) -> Bool {
        guard let username = username, username.count > 0 else {
            view?.showError(message: "Debe ingresar un usuario")
            return false
        }
        
        guard let password = password, password.count > 0 else {
            view?.showError(message: "Debe ingresar una contraseña")
            return false
        }
        
        return true
    }
    
        
    
}
