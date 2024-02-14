//
//  MainVCPresenter.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/29/24.
//

import Foundation

class MainVCPresenter: MainVCPresenting {
    
    var viewController: MainVCControlling?
    var pagination : Pagination!
    
    func present(_ animeData: AnimeSearchResultModel) {
        let currentPage = pagination.page
        let isInitial = currentPage == 1
        
        pagination.page += 1
        pagination.received(animeData.media?.count ?? 0)
        viewController?.render(.getSearchAnimeData(animeData, isInitial))
        
    }
    
    func presentError(_ error: GAPIError) {
        viewController?.viewModel?.errorMessage = error.localizedDescription
        viewController?.render(.getSearchAnimeError(error.localizedDescription))
    }
    
//    func present(_ state: MainVC.State) {
//        switch state {
//        case let .getSearchAnimeData(data):
//            if let media = data.media {
//                viewController?.viewModel?.media = media
//                if let media = viewController?.viewModel?.media {
//                    for item in media {
//                        print("--- RESULT ---")
//                        print("This is Searched Movie's Description: \(item.description ?? "")")
//                        print("This is Searched Movie's Title's English Name: \(item.title?.english ?? "")")
//                        print("This is Searched Movie's Title's Romanji Name: \(item.title?.romaji ?? "")")
//                        print("--- END ---")
//                        print("\n")
//                    }
//                }
//            }
//        case let .getSearchAnimeError(error):
//            print("Error: \(error.localizedDescription)")
//        }
//    }
}
