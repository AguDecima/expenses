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
    var totalExpenses : Double = 0.0
    
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
        expensesTable?.reloadData()
    }
    
    private func setupUI() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cerrar Sesión", style: .plain , target: self, action: #selector(closeSession))
        navigationItem.title = "Mis Gastos"
        
        newExpenseButton?.layer.cornerRadius = 8
        greetingLabel?.text = "¡Hola \(SessionHelper().getUser()!.name!)!"
        
        greetingLabel?.numberOfLines = 1
        greetingLabel?.minimumScaleFactor = 0.5
        greetingLabel?.adjustsFontSizeToFitWidth = true
        greetingLabel?.lineBreakMode = .byWordWrapping
        
        monthlyExpensesLabel?.numberOfLines = 1
        monthlyExpensesLabel?.minimumScaleFactor = 0.5
        monthlyExpensesLabel?.adjustsFontSizeToFitWidth = true
        monthlyExpensesLabel?.lineBreakMode = .byWordWrapping
        
    }
    
    @objc private func closeSession() {
        print("Cerrando Session")
        let refreshAlert = UIAlertController(title: "Cerrar Sesíon", message: "Esta seguro de salir ? 😱", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Si", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
            SessionHelper().closeSession()
            MainWireFrame.navigationToLoginOrHome(from: self)
        }))

        refreshAlert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
            
        }))

        present(refreshAlert, animated: true, completion: nil)
        
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
            cell.setAmountLabel(text: "\(String(describing: expenses[row].amount!))")
            cell.setCategoryLabel(text: expenses[row].category?.name ?? "")
            cell.setDateLabel(text: "\(expenses[row].formatDate()), \(expenses[row].formatTime())")
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
}

extension HomeViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        presenter?.elementSelected(at: row)
    }
}

extension HomeViewController : HomeViewProtocol {
    
    func show(expenses: [Expense]) {
        self.expenses = expenses
        
        var total : Double = 0.0
        _ = expenses.map { (expense) -> Double in
            total += expense.amount!
            return expense.amount!
        }
        
        self.monthlyExpensesLabel?.text = "Gastos este més: $\(String(format: "%.2f", total)) (Caja chica)"
        expensesTable?.reloadData()
    }
    
    func showModal(expense: Expense) {
        HomeWireFrame.navigateToDetailExpense(from: self, expense: expense)
    }
    
    
}
