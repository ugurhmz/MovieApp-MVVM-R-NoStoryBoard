//
//  AppRouter.swift
//  ChallengeApp
//
//  Created by ugur-pc on 4.05.2022.
//

import Foundation
import UIKit


final class AppRouter: Router, AppRouter.Routes {
    
    typealias Routes = HomeRoute
    
    static let shared = AppRouter()
    
    func startApp() {
          placeOnWindowHome()
    }
    
    private func topViewController() -> UIViewController? {
           let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
           if var topController = keyWindow?.rootViewController {
               while let presentedViewController = topController.presentedViewController {
                   topController = presentedViewController
               }
               return topController
           }
           return nil
    }
}
