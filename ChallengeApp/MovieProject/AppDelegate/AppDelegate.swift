//
//  AppDelegate.swift
//  ChallengeApp
//
//  Created by ugur-pc on 3.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        app.router.start()
        
        return true
    }

    
}

