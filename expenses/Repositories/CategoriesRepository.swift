//
//  CategoriesRepository.swift
//  expenses
//
//  Created by Agustin Décima on 24/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
 
class CategoriesRepository: BaseRepository {
    
    func getCategories(completion: @escaping ([Category]?, String?) -> Void) {
        requestBuilder.categories().responseArray { (response: DataResponse<[Category]>) in
            switch response.result {
            case .success:
                completion(response.value ?? [], nil)
            case .failure:
                completion(nil, self.getError(from: response))
            }
        }
    }
}

