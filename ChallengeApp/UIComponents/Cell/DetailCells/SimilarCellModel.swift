//
//  SimilarCellModel.swift
//  ChallengeApp
//
//  Created by ugur-pc on 9.05.2022.
//

import Foundation

protocol SliderCellDataSource: AnyObject {
    var movieId: Int? {get}
    var movieTitle: String? {get}
    var movieReleaseDate: String? {get}
    var movieImageUrl: URL? {get}
}

protocol SliderCellEventSource: AnyObject {
    
}

protocol SimilarCellProtocoL: SliderCellDataSource, SliderCellEventSource {
}

//MARK: -
final class SimilarCellModel: SimilarCellProtocoL {
    
    var movieId: Int?
    var movieTitle: String?
    var movieReleaseDate: String?
    var movieImageUrl: URL?
    
    public init(movieId: Int? = nil,
                movieTitle: String? = nil,
                movieReleaseDate: String? = nil,
                movieImageUrl: URL? = nil)
    {
        self.movieId = movieId
        self.movieTitle = movieTitle
        self.movieReleaseDate = movieReleaseDate
        self.movieImageUrl = movieImageUrl
    }
    
}
