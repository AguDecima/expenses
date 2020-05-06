//
//  DetailExpensePresenter.swift
//  expenses
//
//  Created by Agustin Décima on 05/05/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation

protocol DetailExpenseViewProtocol : class {
    func setExpense()
}

class DetailExpensePresenter {
    
    let view: DetailExpenseViewProtocol?
    
    init(view: DetailExpenseViewProtocol?) {
        self.view = view
    }
    
}

extension DetailExpensePresenter : DetailExpensePresenterProtocol {
    
    func showExpense() {
        view?.setExpense()
    }
}
