//
//  HeaderReusableView.swift
//  ChallengeApp
//
//  Created by ugur-pc on 8.05.2022.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
    static var identifier = "HeaderReusableView"
       
       public let titleLabel: UILabel = {
           let label = UILabel()
           label.font = .systemFont(ofSize: 19, weight: .semibold)
           label.text = "ABC"
           label.textColor = .black
           return label
       }()
       
           override init(frame: CGRect) {
               super.init(frame: frame)
               addSubview(titleLabel)
               setConstraints()
           }

           required init(coder aDecoder: NSCoder) {
               super.init(coder: aDecoder)!
           }
       
       func setConstraints(){
           titleLabel.anchor(top: topAnchor,
                             leading: leadingAnchor,
                             bottom: bottomAnchor,
                             trailing: trailingAnchor,
                             padding: .init(top: 0, left: 5, bottom: 0, right: 0))
       }
}
