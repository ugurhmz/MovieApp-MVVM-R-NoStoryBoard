//
//  HomeViewModel.swift
//  ChallengeApp
//
//  Created by ugur-pc on 6.05.2022.
//

import Foundation

protocol HomeViewModelDataSource {
    var homeTopCell: HomeTopCellProtocol? { get }
    var homeBottomItemsArr: [HomeBottomTableCellProtocol]? { get set}
}

protocol HomeViewModelEventSource {
    var reloadData: VoidClosure? { get set}
    var endRefreshing: VoidClosure? {get set}
    func didSelectItem(at indexPath: IndexPath)
}

protocol HomeViewModelProtocol: HomeViewModelDataSource, HomeViewModelEventSource {
    var isLoading: Bool { get set}
    var increasePage: Int {get set}
    func getMoreMovieData()
}

//MARK: -
final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewModelProtocol {
    
 
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
        router.pushHomeDetail(movieId: selectItemId)
    }
    
    
    func getMoreMovieData() {
        if !self.isLoading {
            self.isLoading = true
            DispatchQueue.global().async {
                sleep(2)
                
                if self.homeBottomItemsArr?.isEmpty == false {
                    self.increasePage += 1
                    //self.getMoviesUPComing
                } else {
                    self.increasePage = 1
                    //get movies
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
                guard let nowPlayingArr = response?.results?.map({ item in
                    return HomeSliderCellModel(image:URL(string: strongSelf.imgPath + (item.poster_path ?? "")) ,
                                               title: item.title,
                                               definition: item.overview,
                                               totalPagesIndicator: response?.results?.count)
                }) else { return}
                strongSelf.homeTopCell = HomeTopCellModel(homeHeaderCellValues: nowPlayingArr)
                strongSelf.endRefreshing?()
                strongSelf.reloadData?()
            case .failure(let error):
                strongSelf.endRefreshing?()
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchUpComingMovies(page: Int?){
            let request = MovieUpcomingRequest(page: page ?? 1)
            dataProvider.request(for: request) { [weak self] result in
                guard let strongSelf = self else {return}
                switch result {
                case .success(let response):
                    guard let movieArr = response?.results?.map({ item in
                        return HomeBottomTableCellModel(id: item.id,
                                                        imageUrl: URL(string: strongSelf.imgPath + (item.posterPath ?? "")),
                                                        title: item.title,
                                                        mvDefinition: item.overview,
                                                        releaseDate: item.releaseDate,
                                                        page: response?.page)
                    }) else { return}
                    strongSelf.homeBottomItemsArr = movieArr
                    strongSelf.endRefreshing?()
                    strongSelf.reloadData?()
                    
                case .failure(let error) :
                    self?.endRefreshing?()
                    print(error.localizedDescription)
                }
            }
   }
}
