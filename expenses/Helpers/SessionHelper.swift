//
//  SessionHelper.swift
//  expenses
//
//  Created by Agustin Décima on 22/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation

class SessionHelper {
    
    let defaults = UserDefaults.standard
    let key = "logged_user"
    
    func save(user: User) {
        defaults.set(user.toJSONString(), forKey: key)
    }
    
    func getUser() -> User? {
        if let jsonString = defaults.object(forKey: key) as? String {
            return User(JSONString: jsonString)
        } else {
            return nil
        }
    }
    
    func closeSession() {
        print("Cierra Sesion")
        defaults.removeObject(forKey: key)
    }
    
}
