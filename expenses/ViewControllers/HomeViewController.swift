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
    
    // OUTLETS
    @IBOutlet weak var greetingLabel: UILabel?
    @IBOutlet weak var monthlyExpensesLabel: UILabel?
    @IBOutlet weak var newExpenseButton: UIButton?
    @IBOutlet weak var expensesTable: UITableView!
    
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cerrar Sesión", style: .plain , target: self, action: #selector(closeSession))
        navigationItem.title = "Mis Gastos"
        
        newExpenseButton?.layer.cornerRadius = 8
        
        greetingLabel?.text = "¡Hola \(SessionHelper().getUser()!.name!)!"
        
    }
    
    @objc private func closeSession() {
        print("Cerrando Session")
        SessionHelper().closeSession()
        MainWireFrame.navigationToLoginOrHome(from: self)
    }
    
    // ACTIONS
    @IBAction func newExpenseAction(_ sender: Any) {
        NewExpenseWireFrame.navigateToNewExpense(from: self)
    }
    
    
}

extension HomeViewController : HomeViewProtocol {
    
}
