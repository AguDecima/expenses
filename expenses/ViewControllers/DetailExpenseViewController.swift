//
//  DetailExpenseViewController.swift
//  expenses
//
//  Created by Agustin Décima on 05/05/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import UIKit

protocol DetailExpensePresenterProtocol : class {
    func showExpense()
}

class DetailExpenseViewController: UIViewController {
    
    // OUTLETS
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var presenter: DetailExpensePresenterProtocol?
    var expense: Expense = Expense()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.showExpense()
    }

}

extension DetailExpenseViewController : DetailExpenseViewProtocol {
    
    func setExpense() {
        self.dateLabel?.text = expense.formatDate()
        self.timeLabel?.text = expense.formatTime()
        let symbol : String = expense.account?.currency?.symbol! ?? ""
        let name : String = expense.account?.currency?.name! ?? ""
        self.currencyLabel?.text = "\(String(describing: symbol)) - \(String(describing: name))"
        self.categoryLabel?.text = expense.category?.name
        self.providerLabel?.text = expense.provider?.name
        self.amountLabel?.text = "$\(String(describing: expense.amount!))"
        self.descriptionLabel?.text = expense.description
        
        navigationItem.title = "#\(expense.id!)"
        
    }
}
