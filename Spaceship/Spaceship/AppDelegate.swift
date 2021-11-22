//
//  AppDelegate.swift
//  Spaceship
//
//  Created by 张维熙 on 2021/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainViewController = ViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        
        self.window?.rootViewController = navigationController
        
        self.window?.backgroundColor = .systemBackground
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

