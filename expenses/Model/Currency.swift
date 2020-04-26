//
//  Currency.swift
//  expenses
//
//  Created by Agustin Décima on 24/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import ObjectMapper

class Currency {
    var id: Int?
    var symbol: String?
    
    init(){}
    
    required init?(map: Map) {}
      
    func mapping(map: Map) {
        id <- map["id"]
        symbol <- map["symbol"]
    }

}
