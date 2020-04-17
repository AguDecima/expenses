//
//  NetworkRequestManager.swift
//  expenses
//
//  Created by Agustin Décima on 17/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import Alamofire
 
class NetworkRequestManager {
}
 
extension NetworkRequestManager: RequestAdapter {
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        // here customize all requests
        return urlRequest
    }
}
