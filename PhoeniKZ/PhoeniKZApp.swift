//
//  PhoeniKZApp.swift
//  PhoeniKZ
//
//  Created by Kaden Zheng on 8/10/22.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
    
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      
    FirebaseApp.configure()

    return true
    
  }
}

@main
struct PhoeniKZApp: App {
    var body: some Scene {
        WindowGroup {
            HomeTabView()
                .environmentObject(Manager())
        }
    }
}
