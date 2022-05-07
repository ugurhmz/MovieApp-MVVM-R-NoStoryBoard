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
    func fetchUpComingMovies(page: Int?){
            let request = MovieUpcomingRequest(page: page ?? 1)
            dataProvider.request(for: request) {[weak self] result in
                guard let self = self else {return}
                switch result {
                case .success(let response):
                    print(response?.results)
                case .failure(let error) :
                    print(error)
                }
            }
   }
}
