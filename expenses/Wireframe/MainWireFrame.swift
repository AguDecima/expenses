//
//  MainWireFrame.swift
//  expenses
//
//  Created by Agustin Décima on 22/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import UIKit

class MainWireFrame {
    
    static func navigationToLoginOrHome(from context: UIViewController) {
        let user = SessionHelper().getUser()
        if user != nil {
            HomeWireFrame.navigateToHome(from: context)
        } else {
            LoginWireframe.navigateToLogin(from: context)
        }
    }
    
}
