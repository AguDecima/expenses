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
}

