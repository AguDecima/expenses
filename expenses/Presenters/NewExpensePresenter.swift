//
//  NewExpensePresenter.swift
//  expenses
//
//  Created by Agustin Décima on 22/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation

protocol NewExpenseViewProtocol: class {
    func navigateToAccountSelector()
    func navigateToCategorySelector()
    func navigateToProviderSelector()
}

class NewExpensePresenter {
    
    weak var view: NewExpenseViewProtocol?
    
    init(view: NewExpenseViewProtocol) {
        self.view = view
    }
}

extension NewExpensePresenter: NewExpensePresenterProtocol {
    
    func accountTapped() {
        view?.navigateToAccountSelector()
    }
    
    func categoryTapped() {
        view?.navigateToCategorySelector()
    }
    
    func providerTapped() {
        view?.navigateToProviderSelector()
    }
    
    func createTapped() {
        
    }
}
