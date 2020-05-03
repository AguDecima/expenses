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
    func fetchData()
    func elementSelected(at index: Int)
}

class HomeViewController : UIViewController {
    
    // OUTLETS
    @IBOutlet weak var greetingLabel: UILabel?
    @IBOutlet weak var monthlyExpensesLabel: UILabel?
    @IBOutlet weak var newExpenseButton: UIButton?
    @IBOutlet weak var expensesTable: UITableView!
    
    var presenter: HomePresenterProtocol?
    var expenses: [Expense] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expensesTable?.register(UINib(nibName: "ExpenseTableViewCell", bundle: .main), forCellReuseIdentifier: "cell");
        expensesTable?.dataSource = self
        expensesTable?.delegate = self
        expensesTable?.rowHeight = 100
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchData()
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

extension HomeViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
               
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ExpenseTableViewCell {
            cell.setAmountLabel(text: "$\(String(describing: expenses[row].amount!))")
            cell.setProviderLabel(text: expenses[row].category?.name ?? "")
            cell.setDateLabel(text: formarDate(date: expenses[row].createAt ?? Date()))
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func formarDate(date: Date) -> String {
        let dateFormat1 = DateFormatter()
        dateFormat1.dateFormat = "EEEE"
        dateFormat1.locale = Locale(identifier: "es_AR")
        let stringDay = dateFormat1.string(from: date)

        let dateFormat2 = DateFormatter()
        dateFormat2.dateFormat = "MMMM"
        dateFormat2.locale = Locale(identifier: "es_AR")
        let stringMonth = dateFormat2.string(from: date)

        let dateFormat3 = DateFormatter()
        dateFormat3.dateFormat = "dd"
        dateFormat3.locale = Locale(identifier: "es_AR")
        let numDay = dateFormat3.string(from: date)
        
        let dateFormat4 = DateFormatter()
        dateFormat4.dateFormat = "yyyy"
        dateFormat4.locale = Locale(identifier: "es_AR")
        let year = dateFormat4.string(from: date)
        
        let dateFormat5 = DateFormatter()
        dateFormat5.dateFormat = "HH:mm"
        dateFormat5.locale = Locale(identifier: "es_AR")
        let hour = dateFormat5.string(from: date)
        
        return "\(stringDay) \(numDay) de \(stringMonth) de \(year), \(hour)"
    }
    
    
}

extension HomeViewController : UITableViewDelegate {
    
}

extension HomeViewController : HomeViewProtocol {
    
    func show(expenses: [Expense]) {
        self.expenses = expenses
        expensesTable?.reloadData()
    }
    
    
}
