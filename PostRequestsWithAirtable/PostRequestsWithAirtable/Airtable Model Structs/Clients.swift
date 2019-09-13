//
//  Clients.swift
//  PostRequestsWithAirtable
//
//  Created by Sam Roman on 9/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation


struct  ClientWrapper: Codable {
    let records: [Clients]
    
    static func getClients(from jsonData: Data) throws -> [Clients] {
        let response = try JSONDecoder().decode(ClientWrapper.self, from: jsonData)
        return response.records
    }
}

struct Clients: Codable {
    let fields: Fields
    
}


struct Fields: Codable {
    
    let about: String?
    let name: String?
    let logo: [LogoWrapper]?
    
    enum CodingKeys: String, CodingKey {
        case about = "About"
        case name = "Name"
        case logo = "Logo"
    }
}


struct LogoWrapper: Codable {
    let url: String?
}

