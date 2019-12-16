//
//  ClientTableViewCell.swift
//  PostRequestsWithAirtable
//
//  Created by Cameron Rivera on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ClientTableViewCell: UITableViewCell {
    @IBOutlet weak var clientNameLabel: UILabel!
    @IBOutlet weak var clientKickOffTimeLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        logoImage.image = nil
    }
    
    func setUpCell(using client: Client){
        guard let url = client.fields.logo.first?.url else {
            return
        }
        
        clientNameLabel.text = client.fields.name
        clientKickOffTimeLabel.text = client.createdTime.convertDateToString()
        ClientAPI.manager.getImage(using: url) { [weak self] result in
            switch result{
            case .failure:
                break
            case .success(let image):
                DispatchQueue.main.async{
                    self?.logoImage.image = image
                }
            }
        }
    }
}
