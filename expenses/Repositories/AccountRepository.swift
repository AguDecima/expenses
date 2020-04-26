//
//  AccountRepository.swift
//  expenses
//
//  Created by Agustin Décima on 24/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class AccountsRepository: BaseRepository {
    
    func getAccounts(completion: @escaping ([Account]?, String?) -> Void) {
        requestBuilder.accounts().responseArray { (dataResponse: DataResponse<[Account]>) in
            switch dataResponse.result {
            case .success:
                completion(dataResponse.value, nil)
            case .failure:
                completion(nil, self.getError(from: dataResponse))
            }
        }
    }
}
