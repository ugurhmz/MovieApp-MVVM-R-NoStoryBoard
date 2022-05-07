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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    private func setupViews(){
        view.addSubview(homeCollectionView)
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
}

//MARK: - Constraints
extension HomeVC {
    private func setConstraints(){
        homeCollectionView.fillSuperview()
    }
}


//MARK: - Delegate, DataSource
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
            topCell.backgroundColor = .blue
            return topCell
            
            
            
        // bottom table cell
        case Sections.UpComingMovies.rawValue:
            guard let bottomCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBottomCell.identifier, for: indexPath) as? HomeBottomCell else {
                return UICollectionViewCell()
            }
            
            bottomCell.backgroundColor = .systemPink
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

