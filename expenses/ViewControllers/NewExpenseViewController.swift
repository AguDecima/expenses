//
//  NewExpenseViewController.swift
//  expenses
//
//  Created by Agustin Décima on 22/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import UIKit

protocol NewExpensePresenterProtocol: class {
    func accountTapped()
    func categoryTapped()
    func providerTapped()
    func createTapped(amount: Double, descripcion: String, quantity: Int)
}


class NewExpenseViewController : UIViewController {
    
     var presenter: NewExpensePresenterProtocol?
       
       @IBOutlet private var accountContainer: UIView?
       @IBOutlet private var accountLabel: UILabel?
       @IBOutlet private var categoryContainer: UIView?
       @IBOutlet private var categoryLabel: UILabel?
       @IBOutlet private var providerContainer: UIView?
       @IBOutlet private var providerLabel: UILabel?
       @IBOutlet private var amountTextField: UITextField?
       @IBOutlet private var descriptionTextField: UITextField?
       @IBOutlet private var quantityTextField: UITextField?
       @IBOutlet private var currencyLabel: UILabel?
       @IBOutlet private var createButton: UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc private func accountSelectorTapped() {
        presenter?.accountTapped()
    }
       
    @objc private func categorySelectorTapped() {
        presenter?.categoryTapped()
    }
       
    @objc private func providerSelectorTapped() {
        presenter?.providerTapped()
    }
       
    @IBAction private func createButtonTapped() {
        let amount: Double = Double(amountTextField?.text ?? "") ?? 0
        let description: String = descriptionTextField?.text ?? ""
        let quantity: Int = Int(quantityTextField?.text ?? "") ?? 0

        presenter?.createTapped(amount: amount, descripcion: description, quantity: quantity)
        
    
    }
    
    private func setupUI(){
        
        accountContainer?.layer.borderWidth = 1
        accountContainer?.layer.borderColor = UIColor.lightGray.cgColor
        accountContainer?.layer.cornerRadius = 8
        
        categoryContainer?.layer.borderWidth = 1
        categoryContainer?.layer.borderColor = UIColor.lightGray.cgColor
        categoryContainer?.layer.cornerRadius = 8
        
        providerContainer?.layer.borderWidth = 1
        providerContainer?.layer.borderColor = UIColor.lightGray.cgColor
        providerContainer?.layer.cornerRadius = 8
        
        amountTextField?.layer.borderWidth = 1
        amountTextField?.layer.borderColor = UIColor.lightGray.cgColor
        amountTextField?.layer.cornerRadius = 8
        
        descriptionTextField?.layer.borderWidth = 1
        descriptionTextField?.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextField?.layer.cornerRadius = 8
        
        quantityTextField?.layer.borderWidth = 1
        quantityTextField?.layer.borderColor = UIColor.lightGray.cgColor
        quantityTextField?.layer.cornerRadius = 8
        
        createButton?.layer.cornerRadius = 8
        
        let gesture1 = UITapGestureRecognizer(target: self, action: #selector(accountSelectorTapped))
        accountContainer?.addGestureRecognizer(gesture1)
        accountContainer?.isUserInteractionEnabled = true
        
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(categorySelectorTapped))
        categoryContainer?.addGestureRecognizer(gesture2)
        categoryContainer?.isUserInteractionEnabled = true
        
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(providerSelectorTapped))
        providerContainer?.addGestureRecognizer(gesture3)
        providerContainer?.isUserInteractionEnabled = true
    }

    
}

extension NewExpenseViewController: NewExpenseViewProtocol {
    
    func resetUI() {
        self.accountLabel?.text = "Seleccione una cuenta"
        self.categoryLabel?.text = "Seleccione una categoría"
        self.providerLabel?.text = "Seleccione un proveedor"
        self.quantityTextField?.text = ""
        self.descriptionTextField?.text = ""
        self.amountTextField?.text = ""
    }
    
    
    func showSuccess(message: String?) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showError(message: String?) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    func navigateToAccountSelector(delegate: AccountSelectorDelegate) {
        SelectorWireFrame.navigateToAccountSelector(from: self, delegate: delegate)
    }
    
    func navigateToCategorySelector(delegate: CategorySelectorDelegate) {
        SelectorWireFrame.navigateToCategorySelector(from: self, delegate: delegate)
    }
    
    func navigateToProviderSelector(categoryId: Int, delegate: ProviderSelectorDelegate) {
        SelectorWireFrame.navigateToProviderSelector(from: self, categoryId: categoryId ,delegate: delegate)
    }
    
    
    func showSelected(account: Account) {
        accountLabel?.text = "Account: \(account.name ?? "")"
        currencyLabel?.text = account.currency?.symbol
    }
    
    func showSelected(category: Category) {
        categoryLabel?.text = "Category: \(category.name ?? "")"
    }
    
    func showSelected(provider: Provider) {
        providerLabel?.text = "Provider: \(provider.name ?? "")"
    }
    
    func hideQuantity(needsNumberOfItemsInExpenses: Bool) {
        if(needsNumberOfItemsInExpenses) {
            quantityTextField?.isHidden = false
        }else{
            quantityTextField?.isHidden = true
        }
        
    }
}
