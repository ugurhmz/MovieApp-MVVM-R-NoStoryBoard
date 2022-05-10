//
//  MovieNowPlayingModel.swift
//  ChallengeApp
//
//  Created by ugur-pc on 10.05.2022.
//

import Foundation

public struct MovieSearchModel : Decodable{
    let page : Int?
    let results : [MovieSearchResult]?
    let totalPages : Int?
    let totalResults : Int?
    
    enum CodingKeys: String, CodingKey {
        case page
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
        
    }
    
}

struct MovieSearchResult : Decodable {
    let adult : Bool?
    let backdropPath : String?
    let genreIDS : [Int]?
    let id : Int?
    let orginalLanguage : String?
    let originalTitle : String?
    let overview : String?
    let popularity: Double?
    let poster_path : String?
    let releaseDate : String?
    let title : String?
    let video: Bool?
    let voteAvareage : Double?
    let voteCount : Int?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS  = "genre_ids"
        case id
        case orginalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity = "popularity"
        case poster_path = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAvareage = "vote_average"
        case voteCount = "vote_count"
    }
    
}

