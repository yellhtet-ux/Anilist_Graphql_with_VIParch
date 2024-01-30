//
//  MainVCInteractor.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/29/24.
//

import Foundation

class MainVCInteractor : MainVCInteracting {
    var presenter: MainVCPresenting?
    
    var worker: AnimeSearchingWorking?
    
    func searchAnime(_ page: Int, _ perPage: Int, searchTerm: String) {
        worker?.searchAnime(page, perPage, searchTerm)
    }
}

extension MainVCInteractor : MainVCAnimeSearchingWorkerDelegate {
    func worker(_ worker: AnimeSearchingWorking, resultHandler: Result<AnimeSearchResultModel, GAPIError>) {
        switch resultHandler {
        case .success(let data):
            presenter?.present(data)
        case .failure(let error):
            presenter?.presentError(error)
        }
    }
}
