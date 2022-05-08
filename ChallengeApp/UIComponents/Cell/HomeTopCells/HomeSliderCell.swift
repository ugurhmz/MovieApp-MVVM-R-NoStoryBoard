//
//  HomeSliderCell.swift
//  ChallengeApp
//
//  Created by ugur-pc on 5.05.2022.
//
import UIKit
import Kingfisher

class HomeSliderCell: UICollectionViewCell {
    static var identifier = "HomeSliderCell"
    
    // movie image
    private let movieImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"v4")
        iv.contentMode = .scaleToFill
        return iv
    }()
        
    // transparent view
    private let transparentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.3)
        return view
    }()
        
    // movie title
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 26, weight: .bold)
        let text = "Spider Man 2013"
        label.attributedText = NSAttributedString(string: text, attributes: [.kern: 1.14])
        label.textColor = .white
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    // movie definition
    private let definitionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        let text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also th"
        label.textColor = .white
        label.numberOfLines = 2
        label.attributedText = NSAttributedString(string: text, attributes: [.kern: 1.18])
        return label
    }()
       
    // StackView for title & definition
    private let labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
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
        [movieImageView, transparentView, labelsStackView].forEach {contentView.addSubview($0)}
        [titleLabel, definitionLabel].forEach{labelsStackView.addArrangedSubview($0)}
    }
}

//MARK: -
extension HomeSliderCell {
    func fillData(movie: HomeSliderCellProtocol) {
        self.titleLabel.text = movie.movieTitle
        self.definitionLabel.text = movie.movieDefinition
        self.movieImageView.kf.setImage(with: movie.moiveImage)
    }
}


//MARK: - Constraints
extension HomeSliderCell {
    private func setConstraints(){
        movieImageView.anchor(top: contentView.topAnchor,
                              leading: contentView.leadingAnchor,
                              bottom: contentView.bottomAnchor,
                              trailing: contentView.trailingAnchor)
        
        transparentView.anchor(top: safeAreaLayoutGuide.topAnchor,
                               leading: contentView.leadingAnchor,
                               bottom: contentView.bottomAnchor,
                               trailing: contentView.trailingAnchor)
        
        labelsStackView.anchor(top: nil,
                               leading: contentView.leadingAnchor,
                               bottom: contentView.bottomAnchor,
                               trailing: contentView.trailingAnchor,
                               padding: .init(top: 0, left: 15, bottom: 70, right: 15))
    }
}
