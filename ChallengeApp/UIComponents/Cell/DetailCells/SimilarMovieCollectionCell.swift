//
//  SimilarMovieCollectionCell.swift
//  ChallengeApp
//
//  Created by ugur-pc on 8.05.2022.
//

import UIKit
import Kingfisher

class SimilarMovieCollectionCell: UICollectionViewCell {
    static var identifier = "SimilarMovieCollectionCell"
    
    // movie image
    private let movieImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"v4")
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 20
        iv.clipsToBounds = true
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(movieImageView)
        movieImageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: 100)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

//MARK: -
extension SimilarMovieCollectionCell {
    func fillSimilarData(movieValue: SimilarCellProtocoL) {
        
        guard let movieImg = movieValue.movieImageUrl else {
            return
        }
        self.movieImageView.kf.setImage(with: movieImg )
    }
}
