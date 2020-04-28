//
//  HomePresenter.swift
//  expenses
//
//  Created by Agustin Décima on 28/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation

protocol HomeViewProtocol : class {
    
}

class HomePresenter {
    
    var view: HomeViewProtocol?
    
    init(view: HomeViewProtocol?) {
        self.view = view
    }
    
}

extension HomePresenter : HomePresenterProtocol {
    
}
