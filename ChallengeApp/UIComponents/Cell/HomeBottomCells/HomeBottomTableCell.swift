//
//  HomeBottomTableCell.swift
//  ChallengeApp
//
//  Created by ugur-pc on 5.05.2022.
//

import UIKit
import Kingfisher

class HomeBottomTableCell: UITableViewCell {
    static var identifier = "HomeBottomTableCell"
    
    private let imgView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "v4")
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    // movie title
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.text = "Spider Man 2013"
        label.textColor = .black
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
        
    // movie definition
    private let definitionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also th"
        label.textColor = .darkGray
        label.numberOfLines = 2
        return label
    }()
       
    // relase date label
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.text = "26-04-1994"
        label.textColor = .darkGray
        return label
    }()
    
    // goToDetailIcon
    private let goToDetailIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "chevron.right")
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .darkGray
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not imp")
    }
    
    private func setupViews(){
        [imgView, titleLabel, definitionLabel, releaseDateLabel, goToDetailIcon].forEach{ contentView.addSubview($0)}
    }
}


//MARK: - Fill Data
extension HomeBottomTableCell {
    func saveModel(model: HomeBottomTableCellProtocol){
        guard let movieImageUrl = model.moiveImage else {
            return
        }
        self.titleLabel.text = model.movieTitle
        self.imgView.kf.setImage(with: movieImageUrl)
    }
}

//MARK: - Constraints
extension HomeBottomTableCell {
    private func setConstraints(){
        
        imgView.anchor(top: contentView.topAnchor,
                       leading: contentView.leadingAnchor,
                       bottom: contentView.bottomAnchor,
                       trailing: nil,
                       padding: .init(top: 15, left: 20, bottom: 15, right: 5),
                       size: .init(width: 120, height: 0))
  
        titleLabel.anchor(top: contentView.topAnchor,
                          leading: imgView.trailingAnchor,
                          bottom: nil,
                          trailing: contentView.trailingAnchor,
                          padding: .init(top: 20, left: 8, bottom: 0, right: 35))
        
        definitionLabel.anchor(top: titleLabel.bottomAnchor,
                               leading: imgView.trailingAnchor,
                               bottom: nil,
                               trailing: contentView.trailingAnchor,
                               padding: .init(top:10, left: 8, bottom: 8, right: 45))
        
        goToDetailIcon.anchor(top: titleLabel.bottomAnchor,
                              leading: nil,
                              bottom: nil,
                              trailing: contentView.trailingAnchor,
                              padding: .init(top: 10, left: 20, bottom: 10, right: 5),
                              size: .init(width: 0, height: 35))
        
        releaseDateLabel.anchor(top: nil,
                                leading: nil,
                                bottom: contentView.bottomAnchor,
                                trailing: contentView.trailingAnchor,
                                padding: .init(top: 0, left: 50, bottom: 20, right: 45))
    }
}
