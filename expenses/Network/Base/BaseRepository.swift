//
//  BaseRepository.swift
//  expenses
//
//  Created by Agustin Décima on 17/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import Alamofire
 
class BaseRepository {
    
    let requestBuilder = ApiRequestBuilder()
    
    func getError<T>(from response: DataResponse<T>) -> String {
        if
            let data = response.data,
            let jsonString = String(data: data, encoding: String.Encoding.utf8),
            var errorResponse = ErrorResponse(JSONString: jsonString) {
            return errorResponse.error
        } else {
            let errorResponse = ErrorResponse()
            return errorResponse.error
        }
    }
}
