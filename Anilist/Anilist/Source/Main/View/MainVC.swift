//
//  MainVC.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/29/24.
//

import UIKit

class MainVC: UIViewController {
    
    var interactor: MainVCInteracting?
    var router: MainVCRouting? 
    var viewModel: MainVCViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.searchAnime(1, 20, searchTerm: "DemonSlayer")
    }
}

extension MainVC : MainVCControlling {
    
}

extension MainVC {
    enum State {
        case getSearchAnimeData(AnimeSearchResultModel)
        case getSearchAnimeError(GAPIError)
    }
}
