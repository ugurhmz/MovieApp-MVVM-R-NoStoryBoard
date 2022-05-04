//
//  ViewController.swift
//  ChallengeApp
//
//  Created by ugur-pc on 3.05.2022.
//

import UIKit

class HomeVC: UIViewController {
        
    private let mySquare: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.purple.cgColor
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mySquare)
        mySquare.frame = CGRect(x: view.frame.width / 2 - 200,
                                y: view.frame.height / 2 - 200,
                                width: 400,
                                height: 400)
        view.backgroundColor = .lightGray
    }

}

