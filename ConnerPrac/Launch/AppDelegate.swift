//
//  AppDelegate.swift
//  ConnerPrac
//
//  Created by Conner on 2022/09/21.
//

import UIKit
import FirebaseCore
import FirebaseDynamicLinks

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure() // Firebase 설정
        return true
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        
        guard let scheme = url.scheme else {
            return false
        }
        
        if let dLink = DynamicLinks.dynamicLinks().dynamicLink(fromCustomSchemeURL: url){
            
            guard let tempURL = dLink.url else {
                return false
            }
//            guard let components = URLComponents(url: tempURL, resolvingAgainstBaseURL: false)?.queryItems else {
//                return false
//            }
            
            print("dynamiclink url: \(tempURL)")
        }
        return false
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool{
        
        guard let url = userActivity.webpageURL else {
            return true
        }
        let handle = DynamicLinks.dynamicLinks().handleUniversalLink(url) { link, _ in
            
            guard let tempURL = link?.url else {
                return
            }
            guard let components = URLComponents(url: tempURL, resolvingAgainstBaseURL: false)?.queryItems else {
                return
            }
            
            
            let rawTargetType = components.first {
                $0.name == "id"
            }
            
            UIApplication.shared.keyWindow?.rootViewController?.navigationController?.pushViewController(DetailVC(), animated: true)
            
            print("dynamiclink userActivity: \(components)")
        }
        return handle
    }
}

