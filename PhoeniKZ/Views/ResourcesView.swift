//
//  ResourcesView.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/12/22.
//

import SwiftUI

struct ResourcesView: View {
    
    @EnvironmentObject var model: Manager
    
    var body: some View {
        
        GeometryReader { geo in
            
            ScrollView {
                
                VStack (spacing: 15) {
                    
                    // MARK: - Image Bar
                    ImageBar(image: "night_school", titleText: "Resources")
                    
                    CenteredWideCard(title: "ASC Sign In")
                        .padding(.bottom)
                    
                    Divider()
                    
                    // MARK: - Category 1
                    
                    VStack (alignment: .leading) {
                        
                        HStack {
                            
                            Text("Category 1")
                                .font(.title2.weight(.semibold))
                            
                        }.padding(.horizontal)
                        
                        ScrollView (.horizontal) {
                            
                            HStack {
                                
                                HomeViewCard(image: "mosaic_phoenix-transparent", title: "Title", rectangleWidth: (geo.size.width-60)/2, rectangleHeight: (geo.size.width-60)/2)
                                    .padding(.leading)
                                    .padding([.bottom, .top, .trailing], 10)
                            }
                        }
                    }
                    
                    // MARK: - Category 2
                    
                    VStack (alignment: .leading) {
                        
                        HStack {
                            
                            Text("Category 2")
                                .font(.title2.weight(.semibold))
                            
                        }.padding(.horizontal)
                            
                        ScrollView (.horizontal) {
                            
                            HStack {
                                
                                HomeViewCard(image: "mosaic_phoenix-transparent", title: "Title", rectangleWidth: (geo.size.width-60)/2, rectangleHeight: (geo.size.width-60)/2)
                                    .padding(.leading)
                                    .padding([.bottom, .top, .trailing], 10)
                            }
                        }
                    }
                    
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct ResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesView()
    }
}
