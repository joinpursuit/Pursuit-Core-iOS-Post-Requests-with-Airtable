//
//  ClientWrapper.swift
//  PostRequestsWithAirtable
//
//  Created by Michelle Cueva on 9/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct ClientWrapper: Codable {
    let client: Client
   
    
    enum CodingKeys: String, CodingKey {
        case client = "fields"
    }
    
}
