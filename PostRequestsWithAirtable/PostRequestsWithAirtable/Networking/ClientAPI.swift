//
//  ClientsAPI.swift
//  PostRequestsWithAirtable
//
//  Created by Cameron Rivera on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation
import UIKit

struct ClientAPI {
    private init() {
        
    }
    
    private var clientURL:URL {
        
        guard let url = URL(string: "https://api.airtable.com/v0/\(Secrets.AirtableProject)/Clients?All%20clients&api_key=\(Secrets.AirtableAPIKey)&maxRecords=14") else {
            fatalError("Unable to create client URL")
        }
            return url
    }
    
    private var clientPostURL: URL {
        guard let url = URL(string: "https://api.airtable.com/v0/\(Secrets.AirtableProject)/Clients?&api_key=\(Secrets.AirtableAPIKey)") else {
            fatalError("Unable to create client URL")
        }
            return url
    }
    
    static let manager = ClientAPI()
    
    func getClients(completion: @escaping (Result<[Client],AppError>) -> ()){
        NetworkHelper.manager.performDataTask(withUrl: clientURL, andMethod: .get) { result in
            switch result{
            case .failure:
                completion(.failure(.noDataReceived))
            case .success(let data):
                do {
                    let clients = try JSONDecoder().decode(ClientResults.self, from: data)
                    completion(.success(clients.records))
                } catch {
                    completion(.failure(.other(rawError: error)))
                }
            }
        }
    }

    func getImage(using urlString: String, completion: @escaping (Result<UIImage,AppError>) -> ()){
        
        guard let url = URL(string: urlString) else{
            completion(.failure(.badURL))
            return
        }
        
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { result in
            switch result{
            case .failure(let appError):
                completion(.failure(.other(rawError: appError)))
            case .success(let data):
                if let image = UIImage(data: data) {
                    completion(.success(image))
                }
            }
        }
    }
    
    func postClients(client: PostClient, completion: @escaping (Result<Bool,AppError>) -> ()){
        
        do{
            let encodedData = try JSONEncoder().encode(client)
            NetworkHelper.manager.performDataTask(withUrl: clientPostURL, andHTTPBody: encodedData, andMethod: .post) { result in
                switch result{
                case .failure(let appError):
                    completion(.failure(appError))
                case .success:
                    completion(.success(true))
                }
            }
        } catch{
            completion(.failure(.other(rawError:error)))
        }
    }
}
