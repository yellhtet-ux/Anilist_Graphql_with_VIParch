//
//  GNetworkService.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/29/24.
//

import Foundation
import Apollo
import ApolloAPI

class GNetworkService {
    static let shared = GNetworkService()
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.anilist.co")!)
    
    func fetcher <Query:GraphQLQuery>(query: Query, completionHandler: @escaping (Result<Query.Data,GAPIError>) -> Void ) {
        apollo.fetch(query: query) { [unowned self] result in
            switch result {
            case let .success(data):
                if let resultData = data.data {
                    completionHandler(.success(resultData))    
                }
            case let .failure(error):
                if let error = error as? GAPIError {
                    completionHandler(.failure(error))                    
                }
            }
        }
    }
}


enum GAPIError : Error {
    case invalidURL,invalidResponse, invalidData, unknownError
}
