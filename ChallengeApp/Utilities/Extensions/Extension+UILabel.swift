//
//  Extension+UILabel.swift
//  ChallengeApp
//
//  Created by ugur-pc on 10.05.2022.
//

import UIKit

extension UILabel {

     func colorString(text: String?, coloredText: String?, color: UIColor? = .lightGray) {

     let attributedString = NSMutableAttributedString(string: text!)
     let range = (text! as NSString).range(of: coloredText!)
         attributedString.setAttributes([NSAttributedString.Key.foregroundColor: color!],
                              range: range)
     self.attributedText = attributedString
 }
}
