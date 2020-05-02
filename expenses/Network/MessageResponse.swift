//
//  MessageResponse.swift
//  expenses
//
//  Created by Agustin Décima on 29/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import ObjectMapper

class MessageResponse: Mappable {
    
    var message: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        message <- map["message"]
    }
}
