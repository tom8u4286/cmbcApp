//
//  AppDelegate.swift
//  NavigationViewPractice
//
//  Created by 曲奕帆 on 2021/3/23.
//

import UIKit
import GoogleMaps

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GMSServices.provideAPIKey("AIzaSyACgsK5ahDr5ufHZQaXjxIt6BHdt86UoCA")
        return true
    }
}
