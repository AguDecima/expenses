//
//  User.swift
//  expenses
//
//  Created by Agustin Décima on 17/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    
    var name: String?
    var token: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        name   <- map["name"]
        token  <- map["authToken"]
    }
    
}
