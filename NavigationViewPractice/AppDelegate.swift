//
//  AppDelegate.swift
//  NavigationViewPractice
//
//  Created by 曲奕帆 on 2021/3/23.
//

import UIKit
import GoogleMaps
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate, GIDSignInDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GMSServices.provideAPIKey("AIzaSyACgsK5ahDr5ufHZQaXjxIt6BHdt86UoCA")
        
        
        // Initialize sign-in
          GIDSignIn.sharedInstance().clientID = "YOUR_CLIENT_ID"
          GIDSignIn.sharedInstance().delegate = self
        
        
        return true
    }
    
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
      if let error = error {
        if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
          print("The user has not signed in before or they have since signed out.")
        } else {
          print("\(error.localizedDescription)")
        }
        return
      }
      // Perform any operations on signed in user here.
//      let userId = user.userID                  // For client-side use only!
//      let idToken = user.authentication.idToken // Safe to send to the server
//      let fullName = user.profile.name
//      let givenName = user.profile.givenName
//      let familyName = user.profile.familyName
//      let email = user.profile.email
      // ...
    }
    
    
    
    
    
}
