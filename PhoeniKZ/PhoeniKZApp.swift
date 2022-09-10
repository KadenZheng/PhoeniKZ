//
//  PhoeniKZApp.swift
//  PhoeniKZ
//
//  Created by Kaden Zheng on 8/10/22.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

@main
struct PhoeniKZApp: App {
    
    init() {
        
        FirebaseApp.configure()
        
    }
    
    var body: some Scene {
        WindowGroup {
            HomeTabView()
                .environmentObject(Manager())
        }
    }
}
