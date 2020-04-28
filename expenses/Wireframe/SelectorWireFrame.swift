//
//  SelectorWireFrame.swift
//  expenses
//
//  Created by Agustin Décima on 25/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import UIKit

class SelectorWireFrame {
    
    static func navigateToAccountSelector(from context: UIViewController, delegate: AccountSelectorDelegate?) {
        let storyboard = UIStoryboard(name: "SelectorViewController", bundle: .main)
        let vc = storyboard.instantiateViewController(identifier: "SelectorViewController") as SelectorViewController
        
        let presenter = AccountSelectorPresenter(view: vc)
        presenter.delegate = delegate
        vc.presenter = presenter
        
        context.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    static func navigateToCategorySelector(from context: UIViewController, delegate: CategorySelectorDelegate?) {
        let storyboard = UIStoryboard(name: "SelectorViewController", bundle: .main)
        let vc = storyboard.instantiateViewController(identifier: "SelectorViewController") as SelectorViewController
        
        let presenter = CategorySelectorPresenter(view: vc)
        presenter.delegate = delegate
        vc.presenter = presenter
           
        context.navigationController?.pushViewController(vc, animated: true)
           
    }
    
    static func navigateToProviderSelector(from context: UIViewController, categoryId: Int, delegate: ProviderSelectorDelegate?) {
        let storyboard = UIStoryboard(name: "SelectorViewController", bundle: .main)
        let vc = storyboard.instantiateViewController(identifier: "SelectorViewController") as SelectorViewController
        
        let presenter = ProviderSelectorPresenter(view: vc)
        presenter.delegate = delegate
        presenter.categoryId = categoryId
        vc.presenter = presenter
        
        context.navigationController?.pushViewController(vc, animated: true)
           
    }
    
}
