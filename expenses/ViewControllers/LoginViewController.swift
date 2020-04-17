//
//  ViewController.swift
//  expenses
//
//  Created by Agustin Décima on 15/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var nombreUsuarioLabel: UITextField?
    @IBOutlet weak var passwordLabel: UITextField?
    @IBOutlet weak var iniciarSesionButton: UIButton?
    
    // Repositories
    let repository = AuthRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nombreUsuarioLabel?.layer.cornerRadius = 8
        passwordLabel?.layer.cornerRadius = 8
        iniciarSesionButton?.layer.cornerRadius = 8
        
    }
    
    //Actions
    @IBAction func inisioSesionAction(_ sender: Any) {
        if let username = nombreUsuarioLabel?.text, let password = passwordLabel?.text {
            repository.login(username: username, password: password, completion: {user in
                print(user?.name)
                print(user?.token)
            })
        }
        
    }
    


}

