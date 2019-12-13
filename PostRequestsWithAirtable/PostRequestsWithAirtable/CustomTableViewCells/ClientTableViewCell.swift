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
        clientNameLabel.text = client.fields.name
        clientKickOffTimeLabel.text = client.fields.kickOffDate.convertDateToString()
        ClientAPI.manager.getImage(using: client.fields.logo.url) { [weak self] result in
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
