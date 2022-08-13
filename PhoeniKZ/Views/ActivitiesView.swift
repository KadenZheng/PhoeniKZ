//
//  ActivitiesView.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/12/22.
//

import SwiftUI

struct ActivitiesView: View {
    
    @EnvironmentObject var model: Manager
    
    var body: some View {
        
        GeometryReader { geo in
            
            ScrollView {
                
                VStack (alignment: .leading, spacing: 20) {
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 70)
                    
                    // MARK: - Schoolwide Events Scroll
                    
                    VStack (alignment: .leading) {
                        
                        HStack {
                            
                            Text("Schoolwide Events")
                                .font(.title.weight(.semibold))
                            
                        }
                        .padding(.horizontal)
                        
                        ScrollView (.horizontal) {
                            
                            HStack {
                                
                                HomeViewCard(image: "mosaic_phoenix-transparent", title: "Title", caption: "Caption", rectangleWidth: (geo.size.width+90)/2, rectangleHeight: (geo.size.width-10)/2)
                                    .padding(.leading)
                                    .padding([.bottom, .top, .trailing], 10)
                                
                            }
                        }
                    }
                    
                    Divider()
                        .frame(width: UIScreen.main.bounds.width - 40)
                    
                    // MARK: - School Life Scroll
                    VStack (alignment: .leading) {
                        
                        HStack {
                            
                            Text("Updates")
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
                    
                    VStack (alignment: .center) {
                        
                        Divider()
                        
                        Text("Club Meeting Dates")
                            .font(.headline.weight(.medium))
                            .padding(.vertical, 5)
                        
                        HLine().stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                            .foregroundColor(.gray)
                            .frame(width: UIScreen.main.bounds.width - 40)
                        
                        HStack {
                            
                            Text("Club Name")
                                .font(.subheadline)
                            
                            Spacer()
                            
                            Text("08/13/2022")
                                .font(.subheadline)
                            
                        }.frame(width: UIScreen.main.bounds.width - 50)
                        
                        HLine().stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                            .foregroundColor(.gray)
                            .frame(width: UIScreen.main.bounds.width - 40)
                            
                            
                    }
                }
            }
            .overlay(
                NavigationBar(text: "Activities")
            )
        }
        
    }
}

struct HLine: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        }
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}
