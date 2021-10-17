//
//  AppDelegate.swift
//  Clicker_App_2.0
//
//  Created by SEAN ULRIC BUGUINA CHUA stu on 13/9/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let w : Wallet = Wallet()
    let a : PriceMenu = PriceMenu()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        w.addPowerUp(powerUp: PowerUpTypes.TIME_FREEZE)
        w.addPowerUp(powerUp: PowerUpTypes.EXPLOSION)
        w.addPowerUp(powerUp: PowerUpTypes.EXPLOSION)
        w.addPowerUp(powerUp: PowerUpTypes.EXPLOSION)
        w.addPowerUp(powerUp: PowerUpTypes.EXPLOSION)
        
        let p : PowerUpTypes = w.usePowerUp(powerUp: PowerUpTypes.MEGA_NUKE)
        print(p)
        let f : Int = a.generatePriceList(PowerUpType: PowerUpTypes.TIME_FREEZE)
        print(f)
        return true
    }

    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

