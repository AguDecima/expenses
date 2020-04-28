//
//  ProviderSelectorPresenter.swift
//  expenses
//
//  Created by Agustin Décima on 25/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation

protocol ProviderSelectorDelegate : class {
    func providerWasSelected(_ provider: Provider)
}

protocol ProviderSelectorViewProtocol: class {
    func show(providers: [Provider])
}


class ProviderSelectorPresenter {
    
    let repository = ProvidersRepository()
    var providers : [Provider] = []
    
    weak var view: ProviderSelectorViewProtocol?
    var delegate: ProviderSelectorDelegate?
    var categoryId: Int?
    
    init(view: ProviderSelectorViewProtocol?) {
        self.view = view
    }
    
}

extension ProviderSelectorPresenter: SelectorPresenterProtocol {
    
    func fetchData() {
        guard let categoryId = categoryId else {
            return
        }
        
        // Aqui en categoryId deberíamos pasar el id de la categoria seleccionada
        repository.getProviders(categoryId: categoryId) { (providers, error) in
            self.providers = providers ?? []
            self.view?.show(providers: providers ?? [])
        }
    }
    
    func elementSelected(at index: Int) {
        let selectedProvider = providers[index]
        delegate?.providerWasSelected(selectedProvider)
    }
}
