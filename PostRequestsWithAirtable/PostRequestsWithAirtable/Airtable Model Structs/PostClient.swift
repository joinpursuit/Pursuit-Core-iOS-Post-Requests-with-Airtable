//
//  PostClient.swift
//  PostRequestsWithAirtable
//
//  Created by Cameron Rivera on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct PostClient: Encodable{
    var name: String
    var about: String
    
    enum CodingKeys: String, CodingKey{
        case name = "Name"
        case about = "About"
    }
}
