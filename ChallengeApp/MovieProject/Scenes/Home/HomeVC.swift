//
//  ViewController.swift
//  ChallengeApp
//
//  Created by ugur-pc on 3.05.2022.
//

import UIKit

enum Sections: Int {
    case NowPlayinsMovies = 0
    case UpComingMovies = 1
}

class HomeVC: BaseViewController<HomeViewModel> {
    static var searchClosure: (([HomeMovieSearchProtocol]) -> Void)?
    
   
    private let homeCollectionView: UICollectionView = {
        let layout =  UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        // register
        cv.register(HomeTopCell.self,
                    forCellWithReuseIdentifier: HomeTopCell.identifier)
        cv.register(HomeBottomCell.self,
                    forCellWithReuseIdentifier: HomeBottomCell.identifier)
        return cv
    }()

    
    private let searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: SearchResultsVC())
        sc.searchBar.placeholder = "Search"
        
        return sc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        
        
        SearchResultsVC.newClosure = { movieId in
            print("myitem", movieId)
            self.viewModel.didSelectSearch(movieId: movieId)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.fetchNowPlayingMovies()
        viewModel.fetchUpComingMovies(page: 1)
    }
    
    private func setupViews(){
        view.addSubview(homeCollectionView)
        navigationItem.searchController = searchController
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        searchController.searchBar.searchTextField.backgroundColor = .lightGray.withAlphaComponent(0.4)
        self.viewModel.reloadData = { [weak self] in
            guard let self = self else { return }
            self.homeCollectionView.reloadData()
        }
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
       
    }
}

//MARK: - Constraints
extension HomeVC {
    private func setConstraints(){
        homeCollectionView.fillSuperview()
    }
}


//MARK: - Searching
extension HomeVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
    
        viewModel.searchBarText(searchBar.text ?? "")
        viewModel.endRefreshing = { [weak self] in
            guard let sarchArr = self?.viewModel.searchMovieArr else { return }
            HomeVC.searchClosure?(sarchArr)
        }
    }
    
}

//MARK: - Delegate, DataSource
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
           let offsetY = scrollView.contentOffset.y
           let contentHeight = scrollView.contentSize.height
           let height = scrollView.frame.size.height
           
           if offsetY > contentHeight - height && !viewModel.isLoading {
               viewModel.getMoreMovieData()
           }
       }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch section {
        case Sections.NowPlayinsMovies.rawValue:
            return 1
        case Sections.UpComingMovies.rawValue:
            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        // topcell
        switch indexPath.section {
        case Sections.NowPlayinsMovies.rawValue:
            guard let topCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTopCell.identifier, for: indexPath) as? HomeTopCell else {
                return UICollectionViewCell()
            }
            
            if let movieValue = viewModel.homeTopCell {
                topCell.setData(movieData: movieValue )
            }
            
            topCell.itemClosure = { item in
                self.viewModel.didSelectTopItem(at: item)
            }
            return topCell
            
            
            
        // bottom table cell
        case Sections.UpComingMovies.rawValue:
            guard let bottomCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBottomCell.identifier, for: indexPath) as? HomeBottomCell else {
                return UICollectionViewCell()
            }
          
            if let movieModel = viewModel.homeBottomItemsArr {
                bottomCell.setData(movieValue: movieModel)
            }
                
            bottomCell.didSelectItemClosure = { item in
                print("myitem",item)
                self.viewModel.didSelectItem(at: item)
            
               
            }
            return bottomCell
        default:
            return UICollectionViewCell()
        }
    }

}

//MARK: - DelegateFlowLayout
extension HomeVC: UICollectionViewDelegateFlowLayout {
    // sizeForItemAt, cell -> w,h
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // topcell
        switch indexPath.section {
        case Sections.NowPlayinsMovies.rawValue:
            return CGSize(width: homeCollectionView.frame.width,
                          height: homeCollectionView.frame.width )
       // bottomListcell
        case Sections.UpComingMovies.rawValue:
            return CGSize(width: homeCollectionView.frame.width,
                          height: homeCollectionView.frame.height)
            
        default:
            return CGSize()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
       
        switch section {
        case Sections.NowPlayinsMovies.rawValue:
            return .zero
        case Sections.UpComingMovies.rawValue:
            return UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
            
        default:
            return .zero
        }
    }
}

