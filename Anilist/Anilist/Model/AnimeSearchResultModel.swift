//
//  AnimeSearchResultModel.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/29/24.
//

import Foundation
import AnilistAPI

struct AnimeSearchResultModel {
    let Page: PageInfo?
    let media: [Media]?
    
    init(Page: PageInfo?, media: [Media]?) {
        self.Page = Page
        self.media = media
    }
             
    init (_ data: PageQuery.Data.Page?) {
        self.Page = PageInfo(data?.pageInfo)
        self.media = data?.media?.compactMap(Media.init)
    }
}

struct Media {
    let id : Int?
    let title: Title?
    let type: String?
    let format: String?
    let episodes: Int?
    let description: String?
    let countryOfOrigin: String?
    let startDate: FuzzyStartDate?
    let endData: FuzzyEndDate?
    
    init(id: Int?, title: Title?, type: String?, format: String?, episodes: Int?, description: String?, countryOfOrigin: String?, startDate: FuzzyStartDate?, endData: FuzzyEndDate?) {
        self.id = id
        self.title = title
        self.type = type
        self.format = format
        self.episodes = episodes
        self.description = description
        self.countryOfOrigin = countryOfOrigin
        self.startDate = startDate
        self.endData = endData
    }
    
    init (_ data: PageQuery.Data.Page.Medium?) {
        self.id = data?.id
        self.title = Title(data?.title)
        self.type = data?.type?.rawValue /// DEBUG -> Might be get error
        self.format = data?.format?.rawValue /// DEBUG -> Might be get error
        self.episodes = data?.episodes
        self.description = data?.description
        self.countryOfOrigin = data?.countryOfOrigin
        self.startDate = FuzzyStartDate(data?.startDate)
        self.endData = FuzzyEndDate(data?.endDate)
    } 
}

struct Title {
    let romaji: String?
    let english: String?
    let native: String?
    let userPreferred: String?
    
    init(romaji: String?, english: String?, native: String?, userPreferred: String?) {
        self.romaji = romaji
        self.english = english
        self.native = native
        self.userPreferred = userPreferred
    }
    
    init (_ data: PageQuery.Data.Page.Medium.Title?) {
        self.romaji = data?.romaji
        self.english = data?.english
        self.native = data?.native
        self.userPreferred = data?.userPreferred
    }
}

struct FuzzyStartDate {
    let day: Int?
    let month: Int?
    let year: Int?
     
    init(day: Int?, month: Int?, year: Int?) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    init (_ data: PageQuery.Data.Page.Medium.StartDate?) {
        self.day = data?.day
        self.month = data?.month
        self.year = data?.year
    }
}

struct FuzzyEndDate {
    let day: Int?
    let month: Int?
    let year: Int?
     
    init(day: Int?, month: Int?, year: Int?) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    init (_ data: PageQuery.Data.Page.Medium.EndDate?) {
        self.day = data?.day
        self.month = data?.month
        self.year = data?.year
    }
}

struct PageInfo {
    let currentPage: Int?
    let perPage: Int?
    let lastPage: Int?
    let total: Int?
    let hasNextPage: Bool?
    
    init(currentPage: Int?, perPage: Int?, lastPage: Int?, total: Int?, hasNextPage: Bool?) {
        self.currentPage = currentPage
        self.perPage = perPage
        self.lastPage = lastPage
        self.total = total
        self.hasNextPage = hasNextPage
    }
    
    init (_ data: AnilistAPI.PageQuery.Data.Page.PageInfo?) {
        self.currentPage = data?.currentPage
        self.perPage = data?.lastPage
        self.lastPage = data?.lastPage
        self.total = data?.total
        self.hasNextPage = data?.hasNextPage
    }
}
