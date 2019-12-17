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
    
    var imageURL = ""
    var clientName = ""
    var timeText = ""
    
    override func prepareForReuse() {
        super.prepareForReuse()
        logoImage.image = nil
    }
    
    func  setUpCell(using client: Client){
        
        clientName = client.fields.name
        timeText = client.createdTime
        
        if clientName == client.fields.name && timeText == client.createdTime{
            
            clientNameLabel.text = client.fields.name
            clientKickOffTimeLabel.text = client.createdTime.convertClientDateToString()
        }
        
        guard let url = client.fields.logo?.first?.url else {
            return
        }
        
        imageURL = url
        ClientAPI.manager.getImage(using: url) { [weak self] result in
            switch result{
            case .failure:
                break
            case .success(let image):
                DispatchQueue.main.async{
                    if self?.imageURL == url{
                        self?.logoImage.image = image
                    }
                }
            }
        }
    }
}
