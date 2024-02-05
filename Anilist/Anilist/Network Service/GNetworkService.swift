//
//  GNetworkService.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/29/24.
//

import Foundation
import Apollo
import ApolloAPI
import RxSwift

// MARK: -  This is Network Service using RxSwift!

class GRXNetworkService {
    static let shared = GRXNetworkService()
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.anilist.co")!)
    
    func fetcher <T:GraphQLQuery> (query: T) -> Observable<Result<T.Data,GAPIError>> {
        return Observable.create { observer in
            let cancellable = self.apollo.fetch(query: query) { result in
                switch result {   
                case .success(let data):
                    if let finalData = data.data {
                        observer.onNext(.success(finalData))
                    }
                case .failure(let error):
                    observer.onNext(.failure(error as! GAPIError))
                    observer.onCompleted()
                }
            }
            return Disposables.create {
                cancellable.cancel()
            }
        }
    }
}

// MARK: - This is Network Service using only Apollo!
class GNetworkService {
    static let shared = GNetworkService()
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.anilist.co")!)
    
    func fetcher <Query:GraphQLQuery>(query: Query, completionHandler: @escaping (Result<Query.Data,GAPIError>) -> Void ) {
        apollo.fetch(query: query) { result in
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
