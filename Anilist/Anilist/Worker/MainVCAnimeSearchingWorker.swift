//
//  MainVCAnimeSearchingWorker.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/29/24.
//

import Foundation
import AnilistAPI
import RxSwift

protocol AnimeSearchingWorking: AnyObject {
    var delegate: MainVCAnimeSearchingWorkerDelegate? {get set}
//    var networkService: GNetworkService? {get set}  
    var networkService: GRXNetworkService? {get set}
    
    func searchAnime(_ page: Int,_ perPage: Int,_ searchKeyword: String) 
}

protocol MainVCAnimeSearchingWorkerDelegate {
    func worker(_ worker: AnimeSearchingWorking, resultHandler:  Result<AnimeSearchResultModel,GAPIError> )
}

class MainVCAnimeSearchingWorker : AnimeSearchingWorking {
    let disposeBag = DisposeBag()
    var networkService: GRXNetworkService?
    
    var delegate: MainVCAnimeSearchingWorkerDelegate?
//    var networkService: GNetworkService?
    
    func searchAnime(_ page: Int, _ perPage: Int, _ searchKeyword: String) {
        let query = PageQuery(page: GraphQLNullable.some(page), perPage: GraphQLNullable.some(perPage), searchTerm: GraphQLNullable.some(searchKeyword))
        
        networkService?.fetcher(query: query)
            .subscribe(onNext: {result in
                switch result {
                case let .success(graphQlData):
                    if let data = graphQlData.page {
                        let animeSearchedModel = AnimeSearchResultModel(data)
                        self.delegate?.worker(self, resultHandler: .success(animeSearchedModel))
                    }
                case let .failure(graphQlError):
                    self.delegate?.worker(self, resultHandler: .failure(graphQlError))
                }
            })
            .disposed(by: disposeBag)
    }
    
//    func searchAnime(_ page: Int, _ perPage: Int, _ searchKeyword: String) {
//        let query = PageQuery(page: GraphQLNullable.some(page), perPage: GraphQLNullable.some(perPage), searchTerm: GraphQLNullable.some(searchKeyword)) 
//        
//        networkService?.fetcher(query: query, completionHandler: {[unowned self] result in
//            switch result {
//            case .success(let successData):
//                DispatchQueue.main.async {
//                    if let data = successData.page {
//                        let animeSearchedModel = AnimeSearchResultModel(data)
//                        self.delegate?.worker(self, resultHandler: .success(animeSearchedModel))
//                    }
//                }
//            case .failure(let failureData):
//                DispatchQueue.main.async {
//                    self.delegate?.worker(self, resultHandler: .failure(failureData))
//                }
//            }
//        })
//    }
    
    
}
