//
//  File.swift
//  PostRequestsWithAirtable
//
//  Created by Michelle Cueva on 9/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation
struct AirtableClientResponse: Codable {
    let clientWrappers: [ClientWrapper]
    
    enum CodingKeys: String, CodingKey {
        case clientWrappers = "records"
    }
}
