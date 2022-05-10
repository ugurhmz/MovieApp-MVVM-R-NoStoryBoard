//
//  SearchMovieObjModel.swift
//  ChallengeApp
//
//  Created by ugur-pc on 10.05.2022.
//

import Foundation

protocol HomeMovieSearchDataSource: AnyObject {
    var movieId: Int? { get set }
    var movieTitle: String? {get}
    var releaseDateLabel: String? { get }
}

protocol HomeMovieSearchProtocol: HomeMovieSearchDataSource {
    
}


final class SearchMovieObjModel: HomeMovieSearchProtocol {
    var movieId: Int?
    var movieTitle: String?
    var releaseDateLabel: String?
    
    public init(id: Int? = nil ,
                title: String? = nil,
                releaseDate: String? = nil )
    {
        self.movieId = id
        self.movieTitle = title
        self.releaseDateLabel = releaseDate
    }
}
