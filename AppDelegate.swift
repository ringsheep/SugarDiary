//
//  AppDelegate.swift
//  SugarDiary
//
//  Created by George Zinyakov on 29/07/2017.
//  Copyright © 2017 George Zinyakov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
        return true
    }
    
    func createTabBarController() -> UITabBarController {
        let diaryViewController = UINavigationController(rootViewController: RecordsListViewController())
        diaryViewController.tabBarItem.title = "Diary"
        diaryViewController.tabBarItem.image = #imageLiteral(resourceName: "icons8-Open Book-100")
        
        let chartsViewController = RecordsChartsViewController()
        chartsViewController.tabBarItem.title = "Charts"
        chartsViewController.tabBarItem.image = #imageLiteral(resourceName: "icons8-Bar Chart-100")
        
        let settingsViewController = SettingsViewController()
        settingsViewController.tabBarItem.title = "Settings"
        settingsViewController.tabBarItem.image = #imageLiteral(resourceName: "icons8-Settings-100")
        
        let viewControllers = [diaryViewController,
                               chartsViewController,
                               settingsViewController]
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(viewControllers, animated: true)
        return tabBarController
    }

}

