//
//  ImageBar.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/11/22.
//

import SwiftUI

struct ImageBar: View {
    
    @EnvironmentObject var model: Manager
    @State var image: String
    @State var titleText: String
    @State var subtitleText: String?
    @State var clipped: Bool
    @State var async: Bool
    @State var imageURL: String?
    @State var gallery: Bool
    @State private var currentIndex = 0
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            
            // MARK: - Gallery
            
            if gallery {
                
                TabView () {
                    
                    ForEach(model.activitiesGalleryData) { data in
                        AsyncImage(url: URL(string: data.url)) { asyncImage in
                            
                            asyncImage
                                .resizable()
                                .scaledToFill()
                                .frame(height: 250)
                                .clipped()
                                .overlay(Color.gray.opacity(0.4))
                            
                        } placeholder: {
                            ZStack {
                                ProgressView()
                                Color.gray.opacity(0.2)
                            }
                            
                        }
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle())
                
            } else {
                
                // MARK: - Async Image
                
                if async {
                    AsyncImage(url: URL(string: imageURL!)) { asyncImage in
                        
                        asyncImage
                            .resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .clipped()
                            .blur(radius: 1.5)
                            .scaleEffect(1.01)
                        
                    } placeholder: {
                        Color.purple.opacity(0.1)
                    }
                } else {
                    
                    // MARK: - Normal Image
                    
                    if clipped == true {
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .clipped()
                            .blur(radius: 1.5)
                            .scaleEffect(1.01)
                    } else {
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .blur(radius: 1.5)
                            .scaleEffect(1.01)
                    }
                }
            }
            
            VStack (alignment: .leading, spacing: 10) {
                
                // MARK: - Texts
                
                Text(titleText)
                    .foregroundColor(.white)
                    .font(.largeTitle.weight(.bold))
                    .shadow(color: .black, radius: 2, x: 1, y: 1)
                
                if subtitleText != nil {
                    Text(subtitleText!)
                        .font(.title3.weight(.medium))
                        .foregroundColor(Color(red: 210/255, green: 210/255, blue: 210/255))
                        .shadow(color: .black, radius: 2, x: 1, y: 1)
                }
            }
            .frame(width: UIScreen.main.bounds.size.width - 50, height: 200, alignment: .bottomLeading)
        }
        
    }
}

struct ImageBar_Previews: PreviewProvider {
    static var previews: some View {
        ImageBar(image: "night_school", titleText: "University High", subtitleText: "8/12/2022", clipped: true, async: true, gallery: false)
    }
}
