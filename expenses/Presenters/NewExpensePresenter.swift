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
}

class NewExpensePresenter {
    
    weak var view: NewExpenseViewProtocol?
    
    var selectedAccount: Account?
    var selectedCategory: Category?
    var selectedProvider: Provider?
    
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
        }
    }
    
    func createTapped(amount: Double, descripcion: String, quantity: Int) {
        print(selectedAccount?.name ?? "")
        print(selectedCategory?.name ?? "")
        print(selectedProvider?.name ?? "")
        print(amount)
        print(descripcion)
        print(quantity)
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
        selectedCategory = category
    }
}

extension NewExpensePresenter : ProviderSelectorDelegate {
    func providerWasSelected(_ provider: Provider) {
        view?.showSelected(provider: provider)
        selectedProvider = provider
    }
}
