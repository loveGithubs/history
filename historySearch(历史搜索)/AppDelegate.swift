//
//  AppDelegate.swift
//  historySearch(历史搜索)
//
//  Created by xin wei on 2022/1/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        let nav = UINavigationController.init(rootViewController: ViewController())
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle


}

