//
//  HomeTopCell.swift
//  ChallengeApp
//
//  Created by ugur-pc on 5.05.2022.
//

import UIKit

class HomeTopCell: UICollectionViewCell {
    static var  identifier = "HomeTopCell"
    weak var movieViewModel: HomeTopCellProtocol?
    
    private let topGeneralCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        //register
        cv.register(HomeSliderCell.self,
                    forCellWithReuseIdentifier: HomeSliderCell.identifier)
        return cv
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = 2
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = .darkGray
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not imp")
    }
    
    private func setupViews() {
        [topGeneralCollection, pageControl].forEach { contentView.addSubview($0)}
        topGeneralCollection.delegate = self
        topGeneralCollection.dataSource = self
    }
}


//MARK: -
extension HomeTopCell {
    func setData(movieData: HomeTopCellProtocol) {
        self.movieViewModel = movieData
        self.pageControl.numberOfPages = movieData.numberOfItems
        self.topGeneralCollection.reloadData()
    }
}


//MARK: - Constraints
extension HomeTopCell {
    
    private func setConstraints() {
        topGeneralCollection.fillSuperview()
        pageControl.centerXInSuperview()
        pageControl.anchor(top: nil,
                                 leading: nil,
                                 bottom: bottomAnchor,
                                 trailing: nil,
                                 padding: .init(top: 0, left: 0, bottom: 10, right: 0))
    }
}

//MARK: - Delegate, DataSource
extension HomeTopCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
    
    
    // paging
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / topGeneralCollection.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  self.movieViewModel?.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSliderCell.identifier, for: indexPath) as? HomeSliderCell else {
            return UICollectionViewCell()
        }
         
        if let cellData = self.movieViewModel?.cellItem(for: indexPath) {
            cell.fillData(movie: cellData)
        }
        return cell
    }
}

//MARK: - ViewDelegateFlowLayout
extension HomeTopCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: topGeneralCollection.frame.width,
                      height: topGeneralCollection.frame.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
  

}
