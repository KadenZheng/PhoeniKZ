//
//  ContentView.swift
//  PhoeniKZ
//
//  Created by Kaden Zheng on 8/10/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: Manager
    
    var body: some View {
        
        GeometryReader { geo in
            
            VStack {
                
                // MARK: - Image Bar
                ImageBar(image: "night_school", titleText: "University High", subtitleText: formatDate())
                
                // MARK: - Read Latest
                LeadingWideCard(Title: "Phoenix Post", icon: "newspaper")
                    
                
                // MARK: - Club Sign In
                CenteredWideCard(title: "Club Sign In", icon1: "arrowtriangle.right.fill", icon2: "arrowtriangle.left.fill")
                    .padding(.bottom)
                
                // MARK: - Events Scroll
                
                VStack (alignment: .leading) {
                    
                    HStack {
                        
                    Text("Upcoming Events")
                        .font(.title2.weight(.bold))
                        
                        
                    Text("See all events")
                            .font(.callout)
                            .padding(.leading, 40)
                        Image(systemName: "arrow.right.circle")
                            .resizable()
                            .frame(width: 17, height: 17)
                        
                    }.padding(.horizontal)
                    .padding(.bottom, -10)
                    
                    ScrollView (.horizontal) {
                        
                        HStack {
                        
                        HomeViewCard(image: "mosaic_phoenix-transparent", title: "Title", caption: "Caption", rectangleWidth: (geo.size.width+35)/2, rectangleHeight: (geo.size.width-25)/2)
                            .padding(.leading)
                            .padding([.bottom, .top, .trailing], 10)
                        
                        HomeViewCard(image: "mosaic_phoenix-transparent", title: "Title", caption: "Caption", rectangleWidth: (geo.size.width+35)/2, rectangleHeight: (geo.size.width-25)/2)
                            .padding(.leading)
                            .padding([.bottom, .top, .trailing], 10)
                            
                        }
                    }
                }
            }
        }
    }
}

func formatDate() -> String {
    
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    
    return dateFormatter.string(from: date)
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Manager())
    }
}
