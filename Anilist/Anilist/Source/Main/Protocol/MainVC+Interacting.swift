//
//  MainVC+Interacting.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/29/24.
//

import Foundation

protocol MainVCInteracting {
    var presenter : MainVCPresenting? {get set}
    var worker: AnimeSearchingWorking? {get set}
    
    func searchAnime(_ page: Int,_ perPage: Int, searchTerm: String) 
}
