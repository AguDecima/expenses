//
//  Expense.swift
//  expenses
//
//  Created by Agustin Décima on 03/05/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import ObjectMapper

class Expense : Mappable {
    var amount: Double?
    var account: Account?
    var category: Category?
    var id: Int?
    var numberOfItems: Int?
    var provider: Provider?
    var description: String?
    var type: String?
    var user: User?
    var createAt: Date?
    
    init() {}
       
    required init?(map: Map) {}
       
    func mapping(map: Map) {
        amount <- map["amount"]
        account <- map["account"]
        category <- map["category"]
        id <- map["id"]
        numberOfItems <- map["numberOfItems"]
        provider <- map["provider"]
        description <- map["description"]
        type <- map["type"]
        user <- map["user"]
    }
}
