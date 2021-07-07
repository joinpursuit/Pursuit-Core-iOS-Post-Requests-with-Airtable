//
//  Client.swift
//  PostRequestsWithAirtable
//
//  Created by Michelle Cueva on 9/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct Client: Codable {
    static func getClients(from jsonData: Data) throws -> [Client] {
        let response = try JSONDecoder().decode(AirtableClientResponse.self, from: jsonData)
        return response.clientWrappers.map { $0.client }
    }
    
    let name: String
    let about: String
    let logo: [Logo]?
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case about = "About"
        case logo = "Logo"
    }
}

struct Logo: Codable {
    let thumbnails: Thumbnails
}

struct Thumbnails: Codable {
    let large: Large
}

struct Large: Codable {
    let url: String
}
