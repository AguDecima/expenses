//
//  ViewController.swift
//  expenses
//
//  Created by Agustin Décima on 15/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import UIKit

protocol LoginPresenterProtocol {
    func login(username: String, password: String)
}

class LoginViewController: UIViewController {
    
    // OUTLETS
    @IBOutlet weak var nombreUsuarioLabel: UITextField?
    @IBOutlet weak var passwordLabel: UITextField?
    @IBOutlet weak var iniciarSesionButton: UIButton?
    
    // PRESENTERS
    var presenter : LoginPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //presenter = LoginPresenter(view: self)
        
        nombreUsuarioLabel?.layer.cornerRadius = 8
        passwordLabel?.layer.cornerRadius = 8
        iniciarSesionButton?.layer.cornerRadius = 8
        
        navigationController?.isNavigationBarHidden = true
        
        
    }
    
    //ACTIONS
    @IBAction func inisioSesionAction(_ sender: Any) {
        if let username = nombreUsuarioLabel?.text, let password = passwordLabel?.text {
            presenter?.login(username: username, password: password)
        }
    }
}

extension LoginViewController : LoginViewControllerProtocol {
    
    func showError(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showLoginSuccess() {
        print("showLoginSuccess")
        navigationController?.isNavigationBarHidden = false
        HomeWireFrame.navigateToHome(from: self)
    }
    
}

