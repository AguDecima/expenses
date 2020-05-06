//
//  SelectorViewControllerFile.swift
//  expenses
//
//  Created by Agustin Décima on 25/04/2020.
//  Copyright © 2020 Agustin Décima. All rights reserved.
//

import Foundation
import UIKit

protocol SelectorPresenterProtocol : class {
    func fetchData()
    func elementSelected(at index: Int)
}

class SelectorViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    
    var elements: [String] = []
    
    var presenter: SelectorPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.register(UINib(nibName: "SelectorTableViewCell", bundle: .main), forCellReuseIdentifier: "cell");
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.rowHeight = 60
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchData()
    }
    
}

extension SelectorViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SelectorTableViewCell {
            cell.set(text: elements[row])
            return cell
        }else{
            return UITableViewCell()
        }
        
    }
    
    
}

extension SelectorViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let row = indexPath.row
           presenter?.elementSelected(at: row)
           navigationController?.popViewController(animated: true)
       }
    
}


extension SelectorViewController: AccountSelectorViewProtocol {
    
    func show(accounts: [Account]) {
        let names = accounts.map { (account) -> String in
            return (account.name ?? "") + " - " + (account.currency?.symbol ?? "")
        }
        
        elements = names
        tableView?.reloadData()
    }
}

extension SelectorViewController: CategorySelectorViewProtocol {
    
    func show(categories: [Category]) {
        let names = categories.map { (category) -> String in
            return (category.name ?? "")
        }
        
        elements = names
        tableView?.reloadData()
    }
}

extension SelectorViewController: ProviderSelectorViewProtocol {
    
    func show(providers: [Provider]) {
        let names = providers.map { (provider) -> String in
            return (provider.name ?? "")
        }
        
        elements = names
        tableView?.reloadData()
    }
}
