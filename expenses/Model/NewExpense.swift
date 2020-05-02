//
//  NewExpense.swift
//  expenses
//
//  Created by Agustin Décima on 29/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import ObjectMapper
 
class NewExpense: Mappable {
    
    var description: String?
    var amount: Double?
    var quantity: Int?
    var categoryId: Int?
    var accountId: Int?
    var providerId: Int?
 
    init() {}
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        description <- map["description"]
        amount <- map["amount"]
        quantity <- map["numberOfItems"]
        categoryId <- map["categoryId"]
        accountId <- map["accountId"]
        providerId <- map["providerId"]
    }
}
