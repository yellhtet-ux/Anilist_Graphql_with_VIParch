//
//  MainVCViewModel.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/29/24.
//

import Foundation

struct MainVCViewModel {
    var media : [Media] = []
    var metaData: PageInfo?
    var errorMessage: String = ""
    var searchTerm: String = ""
    var currentPage: Int = 0
    var perPage: Int = 10
}
