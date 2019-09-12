//
//  ClientsViewController.swift
//  PostRequestsWithAirtable
//
//  Created by Sam Roman on 9/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ClientsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var clientsTableView: UITableView!
    
    private var clients = [Clients]() {
        didSet {
            clientsTableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    


}
