//
//  Client.swift
//  PostRequestsWithAirtable
//
//  Created by Cameron Rivera on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation
// TODO: fix Decoding Errors
struct ClientResults: Decodable{
    let records: [Client]
}

struct Client: Decodable{
    let id: String
    let fields: Fields
}

struct Fields: Decodable{
    let about: String
    let name: String
    let logo: CompanyLogo
    let kickOffDate: String
    
    enum CodingKeys: String, CodingKey {
        case about = "About"
        case name = "Name"
        case logo = "Logo"
        case kickOffDate = "KickOff date"
    }
}

struct CompanyLogo: Decodable{
    let url: String
}
