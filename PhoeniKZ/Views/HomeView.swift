//
//  ContentView.swift
//  PhoeniKZ
//
//  Created by Kaden Zheng on 8/10/22.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        GeometryReader { geo in
            
            LazyVGrid (columns: [GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top)], alignment: .center, spacing: 20, pinnedViews: []) {
                
                HomeViewCard(image: "mosaic_phoenix-transparent", title: "Title", caption: "Caption", rectangleWidth: (geo.size.width-50)/2, rectangleHeight: (geo.size.width+45)/2, imageWidth: (geo.size.width-55)/2, imageHeight: (geo.size.width+40)/2)
                
                HomeViewCard(image: "mosaic_phoenix-transparent", title: "Title", caption: "Caption", rectangleWidth: (geo.size.width-50)/2, rectangleHeight: (geo.size.width+45)/2, imageWidth: (geo.size.width-55)/2, imageHeight: (geo.size.width+40)/2)
                
                HomeViewCard(image: "mosaic_phoenix-transparent", title: "Title", caption: "Caption", rectangleWidth: (geo.size.width-50)/2, rectangleHeight: (geo.size.width+45)/2, imageWidth: (geo.size.width-55)/2, imageHeight: (geo.size.width+40)/2)
                
                HomeViewCard(image: "mosaic_phoenix-transparent", title: "Title", caption: "Caption", rectangleWidth: (geo.size.width-50)/2, rectangleHeight: (geo.size.width+45)/2, imageWidth: (geo.size.width-55)/2, imageHeight: (geo.size.width+40)/2)
            
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
