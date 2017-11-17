//
//  AppDelegate.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2016/12/28.
//  Copyright © 2016年 陈海哥. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        //你可以先定义对象的所属关系 再初始化，做个演示列子而已
//        let vc:ViewController = ViewController()
        //直接指定对象所属初始化，ViewController类已存在，所以不需要再init
        let vc = ViewController()
        //因为nvc从属的UINavigationController并未存在，所以需要init
        let nvc = UINavigationController.init(rootViewController:vc)
        let vc02:ViewController02 = ViewController02();
        let nvc02 = UINavigationController.init(rootViewController: vc02)
        
        let tabbar:TabBarController = TabBarController()
        tabbar.addChildViewController(nvc)
        tabbar.addChildViewController(nvc02)
        
        nvc.tabBarItem.title = "第一个"
        nvc02.tabBarItem.title = "第二个"
        
        vc.navigationItem.title = "One"
        vc02.navigationItem.title = "Two"
        
        self.window?.rootViewController = tabbar
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

