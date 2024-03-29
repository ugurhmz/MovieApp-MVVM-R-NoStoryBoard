//
//  HomeViewModel.swift
//  ChallengeApp
//
//  Created by ugur-pc on 6.05.2022.
//

import Foundation
import UIKit

protocol HomeViewModelDataSource {
    var homeTopCell: HomeTopCellProtocol? { get }
    var homeBottomItemsArr: [HomeBottomTableCellProtocol]? { get set}
    var homeNowPlayingMovieArr: [HomeSliderCellProtocol]? { get set}
}

protocol HomeViewModelEventSource {
    var reloadData: VoidClosure? { get set}
    var endRefreshing: VoidClosure? {get set}
}

protocol HomeViewModelProtocol: HomeViewModelDataSource, HomeViewModelEventSource {
    var isLoading: Bool { get set}
    var increasePage: Int {get set}
    func getMoreMovieData()
    func didSelectItem(at indexPath: IndexPath)
    func searchBarText(_ searchText: String)
}

//MARK: -
final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewModelProtocol {
    private var keyword: String?
    
    func searchBarText(_ searchText: String) {
        self.keyword = searchText
        fetchSearchMovies()
    }
    
  
    
    var homeNowPlayingMovieArr: [HomeSliderCellProtocol]?
    var searchMovieArr: [HomeMovieSearchProtocol]?
    
    var isLoading: Bool = false
    var increasePage: Int = 1
    var homeTopCell: HomeTopCellProtocol?
    var homeBottomItemsArr: [HomeBottomTableCellProtocol]?
    var reloadData: VoidClosure?
    var endRefreshing: VoidClosure?
    let imgPath: String = "https://image.tmdb.org/t/p/original"
    
    init(router: HomeRouter) {
        super.init(router: router)
    }

    func didSelectItem(at indexPath: IndexPath) {
        let selectItemId = homeBottomItemsArr?[indexPath.row].movieId ?? 0
        print("selectItemId",selectItemId)
        
        router.pushHomeDetail(movieId: selectItemId)
    }
    
    func didSelectTopItem(at indexPath: IndexPath) {
        let selectItemId = homeNowPlayingMovieArr?[indexPath.item].movieId ?? 0
        router.pushHomeDetail(movieId: selectItemId)
    }
    
    func didSelectSearch(movieId: Int) {
        router.pushHomeDetail(movieId: movieId)
    }
    
    func getMoreMovieData() {
        if !self.isLoading {
            self.isLoading = true
            DispatchQueue.global().async {
                sleep(UInt32(1.2))
                
                if self.homeBottomItemsArr?.isEmpty == false {
                    self.increasePage += 1
                    self.fetchUpComingMovies(page: self.increasePage)
                } else {
                    self.increasePage = 1
                    self.fetchUpComingMovies(page: self.increasePage)
                }
                
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }
   
}

//MARK: - Fetch Data
extension HomeViewModel {
    func fetchNowPlayingMovies(){
        let request = MovieNowPlayingReuqest()
       dataProvider.request(for: request) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let response):
                guard let nowPlayingArr = response?.results?.map({
                    return HomeSliderCellModel(id: $0.id,
                                                image:URL(string: strongSelf.imgPath + ($0.poster_path ?? "")) ,
                                               title: $0.title,
                                               definition: $0.overview,
                                               totalPagesIndicator: response?.results?.count,
                                               movieReleaseDate: $0.releaseDate
                    )
                }) else { return}
                strongSelf.homeNowPlayingMovieArr = nowPlayingArr
                strongSelf.homeTopCell = HomeTopCellModel(homeHeaderCellValues: nowPlayingArr)
                strongSelf.endRefreshing?()
                strongSelf.reloadData?()
            case .failure(let error):
                strongSelf.endRefreshing?()
                strongSelf.showWarningToast?(error.localizedDescription)
                
            }
        }
    }
    
    func fetchUpComingMovies(page: Int?){
            let request = MovieUpcomingRequest(page: page ?? 1)
            dataProvider.request(for: request) { [weak self] result in
                guard let strongSelf = self else {return}
                switch result {
                case .success(let response):
                    guard let movieArr = response?.results?.map({
                        return HomeBottomTableCellModel(id: $0.id,
                                                        imageUrl: URL(string: strongSelf.imgPath + ($0.posterPath ?? "")),
                                                        title: $0.title,
                                                        mvDefinition: $0.overview,
                                                        releaseDate: $0.releaseDate,
                                                        page: response?.page)
                    }) else { return}
                    strongSelf.homeBottomItemsArr = movieArr
                    strongSelf.endRefreshing?()
                    strongSelf.reloadData?()
                    
                case .failure(let error) :
                    self?.endRefreshing?()
                    strongSelf.showWarningToast?(error.localizedDescription)
                }
            }
   }
    
    func fetchSearchMovies(){
        guard let mykeyword = self.keyword,
              !mykeyword.trimmingCharacters(in: .whitespaces).isEmpty,
              (mykeyword.trimmingCharacters(in: .whitespaces).count) >= 2 else {
                  SnackHelper.showSnack(message: "Lütfen en az 2 karakter giriniz.")
            return
        }
        print("mykeyword",mykeyword)
       
        let request = MovieSearchRequest(searchQuery: mykeyword)
        dataProvider.request(for: request) { [weak self] result in
            switch result {
            case .success(let response):
                guard let searchMovieResultArr = response?.results?.map({
                    return SearchMovieObjModel(id: $0.id,
                                               title: $0.title,
                                               releaseDate: $0.releaseDate)
                }) else { return }
                self?.searchMovieArr = searchMovieResultArr
                self?.endRefreshing?()
                self?.reloadData?()
            case .failure(let error):
                SnackHelper.showSnack(message:error.localizedDescription)
                print("ERR",error.localizedDescription)
            }
        }
    }
}
