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
    var createdAt: String?
    
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
        createdAt <- map["createdAt"]
     }
    
    func formatDate() -> String {
        
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from:createdAt!)
        
        let dateFormat1 = DateFormatter()
        dateFormat1.dateFormat = "EEEE"
        dateFormat1.locale = Locale(identifier: "es_AR")
        let stringDay = dateFormat1.string(from: date!)

        let dateFormat2 = DateFormatter()
        dateFormat2.dateFormat = "MMMM"
        dateFormat2.locale = Locale(identifier: "es_AR")
        let stringMonth = dateFormat2.string(from: date!)

        let dateFormat3 = DateFormatter()
        dateFormat3.dateFormat = "dd"
        dateFormat3.locale = Locale(identifier: "es_AR")
        let numDay = dateFormat3.string(from: date!)
        
        let dateFormat4 = DateFormatter()
        dateFormat4.dateFormat = "yyyy"
        dateFormat4.locale = Locale(identifier: "es_AR")
        let year = dateFormat4.string(from: date!)
        
        return "\(stringDay) \(numDay) de \(stringMonth) de \(year)"
    }
    
    func formatTime() -> String {
        
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from:createdAt!)
        
        let dateFormat5 = DateFormatter()
        dateFormat5.dateFormat = "HH:mm"
        dateFormat5.locale = Locale(identifier: "es_AR")
        let hour = dateFormat5.string(from: date!)
        
        return hour
    }
}
