//
//  HomeViewController.swift
//  expenses
//
//  Created by Agustin Décima on 28/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import UIKit

protocol HomePresenterProtocol : class {
    
}

class HomeViewController : UIViewController {
    
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cerrar Sesión", style: .plain , target: self, action: #selector(closeSession))
        navigationItem.title = "Mis Gastos"
    }
    
    @objc private func closeSession() {
        print("Cerrando Session")
        SessionHelper().closeSession()
        MainWireFrame.navigationToLoginOrHome(from: self)
    }
    
}

extension HomeViewController : HomeViewProtocol {
    
}
