//
//  AppDelegate.swift
//  WorkSpaceOneSDKDemo
//
//  Created by yang.sun on 2019/1/22.
//  Copyright © 2019年 yang.sun. All rights reserved.
//

import UIKit
import AWSDK

public extension Notification.Name {
    static let AWSDKInitialized = Notification.Name("com.air-watch.sdk.initialized")
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,AWControllerDelegate{
    
    

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //初始化
        let controller = AWController.clientInstance()
        
        //Scheme
        controller.callbackScheme = "iosswiftsample"
        
        //代理
        controller.delegate = self
        
        //启动
        controller.start()
        
        
        return true
    }
    
    //调转回来回调
    /*
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        let handedBySDKController = AWController.clientInstance().handleOpenURL(url, fromApplication: sourceApplication)
        if handedBySDKController  {
            AWLogInfo("Handed over open URL to AWController")
            // Workspace ONE SDK's Controller will continue with the result from Open URL.
            return true
        }
        
        return false
    }
    
    */

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

    //AW代理：检查SDK完成设置
    func controllerDidFinishInitialCheck(error: NSError?) {
        
        /*此处可以使用通知 用于实现如果初始化失败的代码逻辑*/
        //NotificationCenter.default.post(name: .AWSDKInitialized, object: error)
    }
   
    
}

