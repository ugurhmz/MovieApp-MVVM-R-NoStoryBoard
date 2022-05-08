//
//  CollectionReusableView.swift
//  ChallengeApp
//
//  Created by ugur-pc on 8.05.2022.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    var label: UILabel = {
             let label: UILabel = UILabel()
             label.textColor = .black
             label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
             label.sizeToFit()
             return label
         }()

     override init(frame: CGRect) {
         super.init(frame: frame)

         addSubview(label)

         label.frame = CGRect(x: 0, y: 0, width: 80, height: 10)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
