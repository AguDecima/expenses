//
//  AccountPresenter.swift
//  expenses
//
//  Created by Agustin Décima on 25/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation

protocol AccountSelectorViewProtocol : class {
    func show(accounts: [Account])
}

class AccountSelectorPresenter {
        
    let repository = AccountsRepository()
    var accounts: [Account] = []
    
    weak var view: AccountSelectorViewProtocol?
    
    init(view: AccountSelectorViewProtocol?){
        self.view = view
    }
}

extension AccountSelectorPresenter: SelectorPresenterProtocol {
    
    func fetchData() {
        repository.getAccounts { (accounts, error) in
            self.accounts = accounts ?? []
            self.view?.show(accounts: accounts ?? [])
        }
    }
    
    func elementSelected(at index: Int) {
        let selectedAccount = accounts[index]
        print(selectedAccount.name)
    }
}
