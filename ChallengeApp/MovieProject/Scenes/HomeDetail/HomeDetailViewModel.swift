//
//  HomeDetailViewModel.swift
//  ChallengeApp
//
//  Created by ugur-pc on 7.05.2022.
//

import Foundation

protocol HomeDetailViewModelDataSource {
    var movieId: Int? {get}
    var movieImage: String? {get}
    var movieRate: Double? { get}
    var movieTitle: String? { get }
    var movieDefinition: String? {get}
    var movieReleaseData: String? {get}
    
}

protocol HomeDetailViewModelEventSource {
    var reloadData: VoidClosure? { get set}
}
protocol HomeDetailViewModelProtocol: HomeDetailViewModelDataSource, HomeDetailViewModelEventSource {
    
}

class HomeDetailViewModel: BaseViewModel<HomeDetailRouter>, HomeDetailViewModelProtocol {
    
    var reloadData: VoidClosure?
    
    var movieReleaseData: String?
    var movieId: Int?
    var movieImage: String?
    var movieRate: Double?
    var movieTitle: String?
    var movieDefinition: String?
    
    var sectionName: String? {
        return "Benzer Filmler"
    }
    
    init(movieId: Int?, router: HomeDetailRouter){
        self.movieId = movieId
        super.init(router: router)
    }
    
    private func setData(detailModel: MovieDetailsModel){
        self.movieTitle = detailModel.title
        self.movieDefinition  = detailModel.overview
        self.movieRate = detailModel.voteAverage
        self.movieImage = detailModel.posterPath
        self.movieReleaseData = detailModel.releaseDate
    }
}

//MARK: - Fetch Data
extension HomeDetailViewModel {
    
    func fetchDetailData() {
        let request = MovieDetailRequest(movieId: movieId ?? 0)
        dataProvider.request(for: request) {  [weak self] result in
            guard let strongSelf = self  else { return }
            switch result {
            case .success(let response):
                guard let response = response else {return}
                strongSelf.setData(detailModel: response)
                strongSelf.reloadData?()
            case .failure(let error):
                strongSelf.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
