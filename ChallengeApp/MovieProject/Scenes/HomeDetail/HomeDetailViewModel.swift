//
//  HomeDetailViewModel.swift
//  ChallengeApp
//
//  Created by ugur-pc on 7.05.2022.
//

import Foundation

protocol HomeDetailViewModelDataSource {
    var movieId: Int? {get}
    var image: String? {get}
    var movieRate: Double? { get}
    var movieTitle: String? { get }
    var movieDefinition: String? {get}
}

protocol HomeDetailViewModelEventSource {
    
}
protocol HomeDetailViewModelProtocol: HomeDetailViewModelDataSource, HomeDetailViewModelEventSource {
    
}

class HomeDetailViewModel: BaseViewModel<HomeDetailRouter>, HomeDetailViewModelProtocol {
    var movieId: Int?
    var image: String?
    var movieRate: Double?
    var movieTitle: String?
    var movieDefinition: String?
    
    init(movieId: Int?, router: HomeDetailRouter){
        self.movieId = movieId
        super.init(router: router)
    }
}
