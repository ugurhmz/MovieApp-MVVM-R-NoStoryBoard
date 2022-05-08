//
//  HomeBottomTableCellModel.swift
//  ChallengeApp
//
//  Created by ugur-pc on 7.05.2022.
//

import Foundation


protocol HomeBottomTableCellDataSource: AnyObject {
    var movieId: Int? { get set }
    var moiveImage: URL? {get}
    var movieTitle: String? {get}
    var movieDefinition: String? { get }
    var releaseDateLabel: String? { get }
    var page: Int? { get}
}

protocol HomeBottomTableCellEventSource: AnyObject {
    
}

protocol HomeBottomTableCellProtocol: HomeBottomTableCellDataSource, HomeBottomTableCellEventSource {
  
}

//MARK: -
final class HomeBottomTableCellModel: HomeBottomTableCellProtocol {
    var movieId: Int?
    var moiveImage: URL?
    var movieTitle: String?
    var movieDefinition: String?
    var releaseDateLabel: String?
    var page: Int?
    
    public init(id: Int? = nil ,
                imageUrl: URL? = nil,
                title: String? = nil,
                mvDefinition: String? = nil,
                releaseDate: String? = nil ,
                page: Int? = nil
    )
    {
        self.movieId = id
        self.moiveImage = imageUrl
        self.movieTitle = title
        self.movieDefinition = mvDefinition
        self.releaseDateLabel = releaseDate
        self.page = page
        
    }
}
