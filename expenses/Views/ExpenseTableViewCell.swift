//
//  ExpenseTableViewCell.swift
//  expenses
//
//  Created by Agustin Décima on 01/05/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {

    // OUTLETS
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var smallBoxLabel: UILabel?
    @IBOutlet weak var amountLabel: UILabel?
    @IBOutlet weak var categoryLabel: UILabel?
    
    func setDateLabel(text: String) {
        self.dateLabel?.text = text
    }
    
    func setSmallBoxLabel(text: String) {
        self.smallBoxLabel?.text = text
    }
    
    func setAmountLabel(text: String) {
        self.amountLabel?.text = text
    }
    
    func setCategoryLabel(text: String) {
        self.categoryLabel?.text = text
    }
    
}
