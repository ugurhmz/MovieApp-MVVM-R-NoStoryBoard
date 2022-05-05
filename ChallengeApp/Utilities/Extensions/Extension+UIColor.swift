//
//  Extension+UIColor.swift
//  ChallengeApp
//
//  Created by ugur-pc on 4.05.2022.
//

import UIKit

extension UIColor {
    static func myRGB(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
