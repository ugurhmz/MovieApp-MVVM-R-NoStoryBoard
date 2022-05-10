//
//  SearchTableCell.swift
//  ChallengeApp
//
//  Created by ugur-pc on 10.05.2022.
//

import UIKit

class SearchTableCell: UITableViewCell {

    static var identifier = "SearchTableCell"
    
    private let iconImg: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "magnifyingglass")
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .black
        return iv
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
       label.font = .systemFont(ofSize: 26, weight: .bold)
       let text = "Spider Man 2013"
       label.attributedText = NSAttributedString(string: text, attributes: [.kern: 1.14])
       label.textColor = .black
       label.numberOfLines = 0
       label.lineBreakMode = .byWordWrapping
       return label
   }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not imp")
    }
    
    private func setupViews() {
        contentView.addSubview(iconImg)
        contentView.addSubview(titleLabel)
    }

}

//MARK: -
extension SearchTableCell {
    private func setConstraints(){
        iconImg.anchor(top: contentView.topAnchor,
                       leading: contentView.leadingAnchor,
                       bottom: contentView.bottomAnchor,
                       trailing: nil,
                       size: .init(width: 30, height: 30))
        
        titleLabel.anchor(top: contentView.topAnchor,
                          leading: iconImg.trailingAnchor,
                          bottom: contentView.bottomAnchor,
                          trailing: contentView.trailingAnchor,
                          padding: .init(top: 0, left: 20, bottom: 5, right: 0)
        )
    }
}
