//
//  SnackHelper.swift
//  ChallengeApp
//
//  Created by ugur-pc on 10.05.2022.
//

import UIKit
import SwiftEntryKit

class SnackHelper {
    
    class func showSnack(message: String) {
        let contentView = UIView()
        contentView.backgroundColor = .lightGray
        
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 23)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = message
        contentView.addSubview(label)
        label.fillSuperview()

        var attributes = EKAttributes.bottomToast
        attributes.hapticFeedbackType = .success
        attributes.positionConstraints.safeArea = .empty(fillSafeArea: true)
        let backgroundColor = EKColor(light: .white, dark: .black)
        attributes.entryBackground = .color(color: backgroundColor)

        SwiftEntryKit.display(entry: contentView, using: attributes)
    }

}
