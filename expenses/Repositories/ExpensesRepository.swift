//
//  ExpensesRepository.swift
//  expenses
//
//  Created by Agustin Décima on 29/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
 
class ExpensesRepository: BaseRepository {
    
    typealias CreateExpenseCompletion = (_ successMessage: String?, _ errorMessage: String?) -> Void
    
    func createExpense(newExpense: NewExpense, completion: @escaping CreateExpenseCompletion) {
        requestBuilder.createNewExpense(data: newExpense).responseObject { (dataResponse : DataResponse<MessageResponse>) in
            switch dataResponse.result {
                case .success:
                    completion(dataResponse.value?.message, nil)
                case .failure:
                    completion(nil, self.getError(from: dataResponse))
            }
        }
    }
    
    func getExpenses(completion: @escaping (_ expenses: [Expense]?, _ errorMessage: String?) -> Void) {
        requestBuilder.getMyExpenses().responseArray { (dataResponse: DataResponse<[Expense]>) in
            switch dataResponse.result {
                case .success:
                    completion(dataResponse.value,nil)
                case .failure:
                    completion(nil,self.getError(from: dataResponse))
            }
        }
    }
}
