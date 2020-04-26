//
//  NewExpenseWireFrame.swift
//  expenses
//
//  Created by Agustin Décima on 22/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import UIKit

class NewExpenseWireFrame {
    
    static func navigateToNewExpense(from context: UIViewController) {
       let storyboard = UIStoryboard(name: "NewExpenseViewController", bundle: .main)
        let newExpenseVC = storyboard.instantiateViewController(identifier: "NewExpenseViewController") as NewExpenseViewController
        let presenter = NewExpensePresenter(view: newExpenseVC)
        newExpenseVC.presenter = presenter
        
        context.navigationController?.pushViewController(newExpenseVC, animated: true)
    }
    
}
