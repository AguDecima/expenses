//
//  HomePresenter.swift
//  expenses
//
//  Created by Agustin Décima on 28/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation

protocol HomeViewProtocol : class {
    func show(expenses: [Expense])
}

class HomePresenter {
    
    let repository = ExpensesRepository()
    var expenses : [Expense] = []
    var view: HomeViewProtocol?
    
    init(view: HomeViewProtocol?) {
        self.view = view
    }
    
}

extension HomePresenter : HomePresenterProtocol {
    func fetchData() {
        repository.getExpenses { (expenses, error) in
            self.expenses = expenses ?? []
            self.view?.show(expenses: expenses ?? [])
            print(self.expenses)
        }
    }
    
    func elementSelected(at index: Int) {
        
    }
    
    
}
