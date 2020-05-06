//
//  HomeWireFrame.swift
//  expenses
//
//  Created by Agustin Décima on 28/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import UIKit

class HomeWireFrame {
    
    static func navigateToHome(from context: UIViewController) {
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: .main)
        let homeVC = storyboard.instantiateViewController(identifier: "HomeViewController") as HomeViewController
        
        let homePresenter = HomePresenter(view: homeVC)
        homeVC.presenter = homePresenter
        
        context.navigationController?.setViewControllers([homeVC], animated: true)
    }
    
    static func navigateToDetailExpense(from context: UIViewController, expense: Expense) {
        let storyboard = UIStoryboard(name: "DetailExpenseViewController", bundle: .main)
        let detailVC = storyboard.instantiateViewController(identifier: "DetailExpenseViewController") as DetailExpenseViewController
        let detailPresenter = DetailExpensePresenter(view: detailVC)
        
        detailVC.presenter = detailPresenter
        detailVC.expense = expense
        
        context.navigationController?.pushViewController(detailVC, animated: true)
    }
}

