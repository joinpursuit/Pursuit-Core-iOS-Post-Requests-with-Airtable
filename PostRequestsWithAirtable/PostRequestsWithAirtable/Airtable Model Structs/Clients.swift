//
//  Clients.swift
//  PostRequestsWithAirtable
//
//  Created by Sam Roman on 9/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct Clients: Codable {
    
    static func getClients(from jsonData: Data) throws -> [Clients] {
        let response = try JSONDecoder().decode([Clients].self, from: jsonData)
        return response
    }
    
    let about: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case about = "About"
        case name = "Name"
    }
}


