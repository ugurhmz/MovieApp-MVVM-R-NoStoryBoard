//
//  HomeSliderCellModel.swift
//  ChallengeApp
//
//  Created by ugur-pc on 6.05.2022.
//

import Foundation

protocol HomeSliderCellDataSource: AnyObject {
    var movieId: Int? { get set }
    var moiveImage: URL? {get}
    var movieTitle: String? {get}
    var movieDefinition: String? { get }
    var totalPagesIndicator: Int? {get set}
    var currentPageIndicator: Int? { get set}
}

protocol HomeSliderCellEventSource: AnyObject {
    
}

protocol HomeSliderCellProtocol: HomeSliderCellDataSource, HomeSliderCellEventSource {
    
}


//MARK: -
final class HomeSliderCellModel: HomeSliderCellProtocol {
    
    var movieId: Int?
    var moiveImage: URL?
    var movieTitle: String?
    var movieDefinition: String?
    var totalPagesIndicator: Int?
    var currentPageIndicator: Int?
    
    public init(id: Int? = nil ,
                image: URL? = nil,
                title: String? = nil,
                definition: String? = nil,
                totalPagesIndicator: Int? = nil,
                currentPageIndicator: Int? = nil)
    {
        self.movieId = id
        self.moiveImage = image
        self.movieTitle = title
        self.movieDefinition = definition
        self.totalPagesIndicator = totalPagesIndicator
        self.currentPageIndicator = currentPageIndicator
        
    }
}
