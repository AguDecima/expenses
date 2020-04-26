//
//  SelectorTableViewCell.swift
//  expenses
//
//  Created by Agustin Décima on 25/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import UIKit

class SelectorTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel?
    
    func set(text: String) {
        self.label?.text = text
    }
    
}
