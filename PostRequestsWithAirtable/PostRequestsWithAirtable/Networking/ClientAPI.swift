//
//  ClientAPI.swift
//  PostRequestsWithAirtable
//
//  Created by Michelle Cueva on 9/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct ClientAPI {
    
    // MARK: - Static Properties
    
    static let manager = ClientAPI()
    
    // MARK: - Internal Methods
    
    func getClients(completionHandler: @escaping (Result<[Client], AppError>) -> Void) {
        NetworkHelper.manager.performDataTask(withUrl: clientURL, andMethod: .get) { result in
            switch result {
            case let .failure(error):
                completionHandler(.failure(error))
                return
            case let .success(data):
                do {
                    let clients = try Client.getClients(from: data)
                    completionHandler(.success(clients))
                }
                catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
    
    func post(_ client: Client, completionHandler: @escaping (Result<Data, AppError>) -> Void) {
        let clientWrapper = ClientWrapper(client: client)
        guard let encodedClientWrapper = try? JSONEncoder().encode(clientWrapper) else {
            fatalError("Unable to json encode project")
        }
        print(String(data: encodedClientWrapper, encoding: .utf8)!)
        NetworkHelper.manager.performDataTask(withUrl: clientURL,
                                              andHTTPBody: encodedClientWrapper,
                                              andMethod: .post,
                                              completionHandler: { result in
                                                switch result {
                                                case let .success(data):
                                                    completionHandler(.success(data))
                                                case let .failure(error):
                                                    completionHandler(.failure(error))
                                                }
        })
    }
    
    // MARK: - Private Properties and Initializers
    
    private var clientURL: URL {
        guard let url =
            URL(string: "https://api.airtable.com/v0/" + Secrets.AirtableProject + "/Clients?view=All%20clients&api_key=" + Secrets.AirtableAPIKey) else {
            fatalError("Error: Invalid URL")
        }
        
        
        return url
    }
    
    private init() {}
}
