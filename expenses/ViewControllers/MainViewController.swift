//
//  MainViewController.swift
//  expenses
//
//  Created by Agustin Décima on 20/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import UIKit

class MainViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
       
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MainWireFrame.navigationToLoginOrHome(from: self)
    }
       
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}
