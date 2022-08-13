//
//  TabView.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/12/22.
//

import SwiftUI

struct HomeTabView: View {
    
    @State var selectedTab: Int = 0
    
    var body: some View {
        
        TabView (selection: $selectedTab) {
            
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "music.note.house")
                        Text("Featured")
                    }
                }
                .tag(0)
            
            ActivitiesView()
                .tabItem {
                    VStack {
                        Image(systemName: "calendar.circle")
                        Text("Activities")
                    }
                }
                .tag(1)
            
            ResourcesView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet.below.rectangle")
                        Text("Resources")
                    }
                }
                .tag(2)
        }
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
