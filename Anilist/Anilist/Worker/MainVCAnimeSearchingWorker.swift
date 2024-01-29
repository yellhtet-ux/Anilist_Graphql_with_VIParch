//
//  MainVCAnimeSearchingWorker.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/29/24.
//

import Foundation
import AnilistAPI

protocol AnimeSearchingWorking: AnyObject {
    var delegate: MainVCAnimeSearchingWorkerDelegate? {get set}
    var networkService: GNetworkService? {get set}  
    
    func searchAnime(_ page: Int,_ perPage: Int,_ searchKeyword: String) 
}

protocol MainVCAnimeSearchingWorkerDelegate {
    func worker(_ worker: AnimeSearchingWorking, resultHandler:  Result<AnimeSearchResultModel,GAPIError> )
}

class MainVCAnimeSearchingWorker : AnimeSearchingWorking {
    var delegate: MainVCAnimeSearchingWorkerDelegate?
    var networkService: GNetworkService?
    
    func searchAnime(_ page: Int, _ perPage: Int, _ searchKeyword: String) {
        let query = PageQuery(page: GraphQLNullable.some(page), perPage: GraphQLNullable.some(perPage), searchTerm: GraphQLNullable.some(searchKeyword)) 
        
        networkService?.fetcher(query: query, completionHandler: {[unowned self] result in
            switch result {
            case .success(let successData):
                if let data = successData.page {
                    let animeSearchedModel = AnimeSearchResultModel(data)
                    self.delegate?.worker(self, resultHandler: .success(animeSearchedModel))
                }
            case .failure(let failureData):
                self.delegate?.worker(self, resultHandler: .failure(failureData))
            }
        })
    }
    
    
}
