//
//  AppDelegate.swift
//  New-Cat-Viewer
//
//  Created by Lagrange1813 on 2021/11/8.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = CatTableViewController()
        return true
    }
}
