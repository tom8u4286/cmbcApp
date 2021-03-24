//
//  NavigationViewPracticeApp.swift
//  NavigationViewPractice
//
//  Created by 曲奕帆 on 2021/3/17.
//

import SwiftUI


@main
struct NavigationViewPractice: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
        
    var body: some Scene {
        WindowGroup {
            BaseTabView()
            //ContentView()
            //newsView()
        
        }
    }
}

