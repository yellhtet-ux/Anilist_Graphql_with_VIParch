//
//  MainVCPresenter.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/29/24.
//

import Foundation

class MainVCPresenter: MainVCPresenting {
    var viewController: MainVCControlling?
    
    func present(_ state: MainVC.State) {
        switch state {
        case let .getSearchAnimeData(data):
            if let media = data.media {
                viewController?.viewModel?.media = media
                if let media = viewController?.viewModel?.media {
                    for item in media {
                        print("--- RESULT ---")
                        print("This is Searched Movie's Description: \(item.description ?? "")")
                        print("This is Searched Movie's Title's English Name: \(item.title?.english ?? "")")
                        print("This is Searched Movie's Title's Romanji Name: \(item.title?.romaji ?? "")")
                        print("--- END ---")
                        print("\n")
                    }
                }
            }
        case let .getSearchAnimeError(error):
            print("Error: \(error.localizedDescription)")
        }
    }
}
