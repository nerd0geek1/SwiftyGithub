//
//  AppDelegate.swift
//  SwiftyGithub
//
//  Created by Kohei Tabata on 7/27/15.
//  Copyright (c) 2015 Kohei Tabata. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        setupViewController()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }
    
    //MARK: - private
    
    func setupViewController() {
        if AuthService.sharedService.isSignedIn() {
            let tabBarController = UITabBarController()
            let repositoryViewController = RepositoryViewController()
            let repositoryNavigationController = UINavigationController(rootViewController: repositoryViewController)
            tabBarController.viewControllers = [repositoryNavigationController]
            window?.rootViewController = tabBarController
        } else {
            let viewController = AuthViewController(nibName: nil, bundle: nil)
            window?.rootViewController = viewController
        }
        window?.makeKeyAndVisible()
    }
}