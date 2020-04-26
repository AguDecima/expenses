//
//  LoginWireFrame.swift
//  expenses
//
//  Created by Agustin Décima on 20/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import UIKit

class LoginWireframe {
    
    static func navigateToLogin(from context: UIViewController) {
        print("me active")
        let stotyboard = UIStoryboard(name: "LoginViewController", bundle: .main)
        let loginVC = stotyboard.instantiateViewController(identifier: "LoginViewController") as LoginViewController
        
        let loginPresenter = LoginPresenter(view: loginVC)
        loginVC.presenter = loginPresenter
        
        context.navigationController?.setViewControllers([loginVC], animated: true)
    }
    
}
