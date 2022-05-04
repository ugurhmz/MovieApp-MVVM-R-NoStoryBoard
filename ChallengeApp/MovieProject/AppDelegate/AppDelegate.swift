//
//  AppDelegate.swift
//  ChallengeApp
//
//  Created by ugur-pc on 3.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?

      func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
          // Override point for customization after application launch.
          app.router.start()
          return true
      }

    
}

