//
//  ClientController.swift
//  PostRequestsWithAirtable
//
//  Created by Cameron Rivera on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ClientController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var clients = [Client](){
        didSet{
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setUp()
    }
    
    private func setUp(){
        ClientAPI.manager.getClients { [weak self] result in
            switch result{
            case .failure(let appError):
                self?.showAlert(title: "Error Populating Client Array", message: "\(appError)")
            case .success(let clientArr):
                self?.clients = clientArr
            }
        }
    }
}

extension ClientController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let xCell = tableView.dequeueReusableCell(withIdentifier: "clientCell", for: indexPath) as? ClientTableViewCell else {
            fatalError("Could not dequeue cell as a Client Table View Cell")
        }
        xCell.setUpCell(using: clients[indexPath.row])
        return xCell
    }
}

extension ClientController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
