//
//  PhoeniKZApp.swift
//  PhoeniKZ
//
//  Created by Kaden Zheng on 8/10/22.
//

import SwiftUI

@main
struct PhoeniKZApp: App {
    var body: some Scene {
        WindowGroup {
            HomeTabView()
                .environmentObject(Manager())
        }
    }
}
