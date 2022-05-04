//
//  AppRouter.swift
//  ChallengeApp
//
//  Created by ugur-pc on 3.05.2022.
//

import UIKit

final class AppRouter {
    var window: UIWindow
      
      
      init () {
          window = UIWindow(frame: UIScreen.main.bounds)
      }
      
      
      func start(){
         
          let viewController = HomeBuilder.showHome()
          let navigationController = UINavigationController(rootViewController: viewController)
          window.rootViewController = navigationController
          window.makeKeyAndVisible()
          
      }
}
