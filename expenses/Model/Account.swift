//
//  Account.swift
//  expenses
//
//  Created by Agustin Décima on 24/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import ObjectMapper

class Account: Mappable {
    
    var id: Int?
    var name: String?
    var currency: Currency?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        currency <- map["currency"]
    }
}
