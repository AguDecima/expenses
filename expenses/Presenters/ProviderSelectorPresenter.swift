//
//  ProviderSelectorPresenter.swift
//  expenses
//
//  Created by Agustin Décima on 25/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation

protocol ProviderSelectorViewProtocol: class {
    func show(providers: [Provider])
}


class ProviderSelectorPresenter {
    
    let repository = ProvidersRepository()
    var providers : [Provider] = []
    
    weak var view: ProviderSelectorViewProtocol?
    
    init(view: ProviderSelectorViewProtocol?) {
        self.view = view
    }
    
}

extension ProviderSelectorPresenter: SelectorPresenterProtocol {
    
    func fetchData() {
        // Aqui en categoryId deberíamos pasar el id de la categoria seleccionada
        repository.getProviders(categoryId: 1) { (providers, error) in
            self.providers = providers ?? []
            self.view?.show(providers: providers ?? [])
        }
    }
    
    func elementSelected(at index: Int) {
        let selectedProvider = providers[index]
        print(selectedProvider.name)
    }
}
