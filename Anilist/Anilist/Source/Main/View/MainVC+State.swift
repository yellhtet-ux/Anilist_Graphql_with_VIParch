//
//  MainVC+State.swift
//  Anilist
//
//  Created by Andrew Hardin on 2/7/24.
//

import Foundation

extension MainVC {
    enum State {
        case getSearchAnimeData(AnimeSearchResultModel,Bool)
        case getSearchAnimeError(String)
    }
}
