//
//  HomeDetailVC.swift
//  ChallengeApp
//
//  Created by ugur-pc on 7.05.2022.
//

import UIKit

class HomeDetailVC: BaseViewController<HomeDetailViewModel> {

    private let navigationBar : UINavigationBar = {
            let navBar = UINavigationBar()
            let navigationItem =  UINavigationItem()
            let button = UIBarButtonItem()
            let standardAppearance = UINavigationBarAppearance()
            standardAppearance.configureWithOpaqueBackground()
            standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            standardAppearance.backgroundColor = .white
            navigationItem.standardAppearance = standardAppearance
            navigationItem.scrollEdgeAppearance = standardAppearance
            navigationItem.compactAppearance = standardAppearance
            
            let buttonAppearance = UIBarButtonItemAppearance()
            buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black,.font : UIFont.systemFont(ofSize:20, weight: .bold)]
            button.tintColor = .black
            navigationItem.standardAppearance?.buttonAppearance = buttonAppearance
            navigationItem.compactAppearance?.buttonAppearance = buttonAppearance
            
            button.image = UIImage(systemName: "arrowshape.turn.up.left")
            button.action = #selector(backToHomePageBtn)
            
            
            navigationItem.title =  "Ger"
            navigationItem.leftBarButtonItem = button
            navBar.setItems([navigationItem], animated: false)
            return navBar
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(navigationBar)
        setConstraints()
    }
    
    
  @objc func backToHomePageBtn(){
       dismiss(animated: true, completion: nil)
   }

}

//MARK: - Constraints
extension HomeDetailVC {
    private func setConstraints(){
        navigationBar.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                             leading: view.leadingAnchor,
                             bottom: nil,
                             trailing: view.trailingAnchor)
    }
}
