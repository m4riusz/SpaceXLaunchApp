//
//  AppDelegate.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setupRootViewController()
        return true
    }
    
    fileprivate func setupRootViewController() {
        let tabBarController = UITabBarController()
        let nextLaunchController = DependencyContainer.resolve(NextLaunchController.self)
        nextLaunchController.tabBarItem = UITabBarItem(title: "Next launch".localized(),
                                                       image: .withImage(.launch),
                                                       selectedImage: nil)
        let launchListController = DependencyContainer.resolve(LaunchListController.self)
        launchListController.tabBarItem = UITabBarItem(title: "History".localized(),
                                                       image: .withImage(.list),
                                                       selectedImage: nil)
        let infoController  = DependencyContainer.resolve(InfoController.self)
        infoController.tabBarItem = UITabBarItem(title: "Info".localized(),
                                                 image: .withImage(.info),
                                                 selectedImage: nil)
        tabBarController.viewControllers = [
            UINavigationController(rootViewController: nextLaunchController),
            UINavigationController(rootViewController: launchListController),
            UINavigationController(rootViewController: infoController)
        ]
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
    }
}
