//
//  ClientsViewController.swift
//  PostRequestsWithAirtable
//
//  Created by Michelle Cueva on 9/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ClientsViewController: UIViewController {

    @IBOutlet var clientsTableView: UITableView!
    
    // MARK: - Private Properties
    
    private var clients = [Client]() {
        didSet {
            clientsTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    // MARK: - Private Methods
    
    private func configureTableView() {
        clientsTableView.delegate = self
        clientsTableView.dataSource = self
        clientsTableView.rowHeight = 160
    }
    
    private func loadData() {
        ClientAPI.manager.getClients { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case let .success(clients):
                    self?.clients = clients
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
}

extension ClientsViewController: UITableViewDelegate {}

extension ClientsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clients.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let client = clients[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "clientCell", for: indexPath) as! ClientTableViewCell
        
        cell.nameLabel.text = client.name
        
        if let clientImage = client.logo {
            ImageHelper.shared.getImage(urlStr: clientImage[0].thumbnails.large.url) { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let imageFromOnline):
                        cell.logoImage.image = imageFromOnline
                    }
                }
            }
        }
        
        
        return cell
    }
}



