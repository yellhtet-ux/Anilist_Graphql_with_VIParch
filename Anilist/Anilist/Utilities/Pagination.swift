//
//  Pagination.swift
//  Anilist
//
//  Created by Andrew Hardin on 2/14/24.
//

import Foundation

struct Pagination {
    var page : Int
    var limit: Int 
    private(set) var hasNext: Bool = false
    
    mutating func reset () {
        self.page = 1
        self.hasNext = false
    }
    
    mutating func received(_ itemCount: Int) {
        if itemCount < 1 {
            self.hasNext = false
        }else {
            self.hasNext = true
        }
    }
    
}
