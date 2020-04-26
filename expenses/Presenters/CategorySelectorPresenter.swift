//
//  CategorySelectorPresenter.swift
//  expenses
//
//  Created by Agustin Décima on 25/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation

protocol CategorySelectorViewProtocol : class {
    func show(categories: [Category])
}


class CategorySelectorPresenter {
    
    let repository = CategoriesRepository()
    var categories: [Category] = []
    
    weak var view: CategorySelectorViewProtocol?
    
    init(view: CategorySelectorViewProtocol?) {
        self.view = view
    }
    
    
}

extension CategorySelectorPresenter: SelectorPresenterProtocol {
    
    func fetchData() {
        repository.getCategories { (categories, error) in
            self.categories = categories ?? []
            self.view?.show(categories: categories ?? [])
        }
    }
    
    func elementSelected(at index: Int) {
        let selectedCategory = categories[index]
        print(selectedCategory.name)
    }
}
