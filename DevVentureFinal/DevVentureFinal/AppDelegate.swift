//
//  AppDelegate.swift
//  DevVentureFinal
//
//  Created by Caio  Marastoni on 11/06/20.
//  Copyright © 2020 DevVenture. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = ViewController()
        
        return true
    }

}

