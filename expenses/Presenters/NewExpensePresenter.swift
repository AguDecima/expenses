//
//  NewExpensePresenter.swift
//  expenses
//
//  Created by Agustin Décima on 22/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation

protocol NewExpenseViewProtocol: class {
    
    func navigateToAccountSelector(delegate: AccountSelectorDelegate)
    func navigateToCategorySelector(delegate: CategorySelectorDelegate)
    func navigateToProviderSelector(categoryId: Int, delegate: ProviderSelectorDelegate)
    func showSelected(account: Account)
    func showSelected(category: Category)
    func showSelected(provider: Provider)
    func showSuccess(message: String?)
    func showError(message: String?)
    func hideQuantity(needsNumberOfItemsInExpenses: Bool)
    func resetUI()
}

class NewExpensePresenter {
    
    weak var view: NewExpenseViewProtocol?
    
    var selectedAccount: Account?
    var selectedCategory: Category?
    var selectedProvider: Provider?
    var amount: Double?
    var quantity: Int?
    var description: String?
    
    let repository = ExpensesRepository()
    
    init(view: NewExpenseViewProtocol) {
        self.view = view
    }
}

extension NewExpensePresenter: NewExpensePresenterProtocol {
        
    
    func accountTapped() {
        view?.navigateToAccountSelector(delegate: self)
    }
    
    func categoryTapped() {
        view?.navigateToCategorySelector(delegate: self)
    }
    
    func providerTapped() {
        if let categoryId = selectedCategory?.id {
            view?.navigateToProviderSelector(categoryId: categoryId, delegate: self)
        } else {
            print("no seleccionó categoria aun")
            view?.showError(message: "No seleccionó una catregoria aun.")
        }
    }
    
    func createTapped(amount: Double, descripcion: String, quantity: Int) {
        self.amount = amount
        self.description = descripcion
        self.quantity = quantity
        
        guard validateInputs() else { return }
        
        let newExpense = getNewExpense()
        
        repository.createExpense(newExpense: newExpense) { (successMsg, errorMsg) in
            if errorMsg == nil {
                self.view?.showSuccess(message: successMsg)
                self.view?.resetUI()
            } else {
                self.view?.showError(message: errorMsg)
            }
        }
        
   
    }
    
    func validateInputs() -> Bool {
        
        guard selectedAccount != nil else {
            view?.showError(message: "Debe seleccionar una cuenta")
            return false
        }
        
        guard selectedCategory != nil else {
            view?.showError(message: "Debe seleccionar una categoria")
            return false
        }
        
        guard selectedProvider != nil else {
            view?.showError(message: "Debe seleccionar un proveedor")
            return false
        }
        
        guard let amount = amount, amount > 0.0 else {
            view?.showError(message: "El monto no puede ser menor a 0")
            return false
        }
        
        guard let description = description, !description.isEmpty, description.count > 0 else {
            view?.showError(message: "La descripcion no puede ser vacío")
            return false
        }
        
//        guard let quantity = quantity, quantity > 0 else {
//            view?.showError(message: "La cantidad no puede ser menor a 0")
//            return false
//        }
        
        return true
    }
    
    func getNewExpense() -> NewExpense {
        let newExpense = NewExpense()
        newExpense.amount = amount
        newExpense.quantity = quantity
        newExpense.description = description
        newExpense.accountId = selectedAccount?.id
        newExpense.categoryId = selectedAccount?.id
        newExpense.providerId = selectedProvider?.id
        return newExpense
    }
    
}

extension NewExpensePresenter : AccountSelectorDelegate {
    func accountWasSelected(_ account: Account) {
        view?.showSelected(account: account)
        selectedAccount = account
    }
}

extension NewExpensePresenter : CategorySelectorDelegate {
    func categoryWasSelected(_ category: Category) {
        view?.showSelected(category: category)
        view?.hideQuantity(needsNumberOfItemsInExpenses: category.needsNumberOfItemsInExpenses!)
        selectedCategory = category
        
    }
}

extension NewExpensePresenter : ProviderSelectorDelegate {
    func providerWasSelected(_ provider: Provider) {
        view?.showSelected(provider: provider)
        selectedProvider = provider
    }
}
