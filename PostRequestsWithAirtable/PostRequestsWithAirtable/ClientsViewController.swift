//
//  ClientsViewController.swift
//  PostRequestsWithAirtable
//
//  Created by Sam Roman on 9/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ClientsViewController: UIViewController, UITableViewDelegate {
    
    
    
    @IBOutlet weak var clientsTableView: UITableView!
    
    private var clients = [Clients]() {
        didSet {
            clientsTableView.reloadData()
        }
    }

    
    private func loadData() {
        ClientsAPIClient.manager.getClients { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case let .success(data):
                    self?.clients = data
                case let .failure(error):
                    self?.displayErrorAlert(with: error)
                }
            }
        }
    }
    
    private func displayErrorAlert(with error: AppError) {
        let alertVC = UIAlertController(title: "Error Fetching Data", message: "\(error)", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }

    private func configureTableView() {
       clientsTableView.delegate = self
       clientsTableView.dataSource = self
    }
    
    
    override func viewDidLoad() {
        configureTableView()
        super.viewDidLoad()

    
    }
    


}



extension ClientsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let client = clients[indexPath.row].fields
        let cell = tableView.dequeueReusableCell(withIdentifier: "clientCell", for: indexPath)
        cell.textLabel?.text = client.name
        cell.detailTextLabel?.text = client.about
        return cell
    }
    
}
