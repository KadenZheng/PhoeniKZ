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
    @State var activitiesGallery: Bool
    @State var homeGallery: Bool
    @State private var currentActivitiesIndex = 0
    @State private var currentHomeIndex = 0
    private let timer = Timer.publish(every: 6, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            
            // MARK: - Gallery
            
            if activitiesGallery {
                
                TabView (selection: $currentActivitiesIndex) {
                    
                    ForEach(0..<model.activitiesGalleryData.count, id: \.self) { num in
                        
                        AsyncImage(url: URL(string: model.activitiesGalleryData[num].url)) { asyncImage in
                            
                            asyncImage
                                .resizable()
                                .scaledToFill()
                                .frame(height: 250)
                                .clipped()
                                .overlay(Color.gray.opacity(0.225))
                                .tag(num)
                            
                        } placeholder: {
                            ZStack {
                                ProgressView()
                                Color.gray.opacity(0.2)
                            }
                            
                        }
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle())
                .onReceive(timer) { _ in
                    withAnimation {
                        if currentActivitiesIndex < model.activitiesGalleryData.count - 1 {
                            currentActivitiesIndex = currentActivitiesIndex + 1
                        } else {
                            currentActivitiesIndex = 0
                        }
                    }
                }
                
            } else if homeGallery {
                
                TabView (selection: $currentHomeIndex) {
                    
                    ForEach(0..<model.homeGalleryData.count, id: \.self) { num in
                        
                        AsyncImage(url: URL(string: model.homeGalleryData[num].url)) { asyncImage in
                            
                            asyncImage
                                .resizable()
                                .scaledToFill()
                                .frame(height: 250)
                                .clipped()
                                .overlay(Color.gray.opacity(0.275))
                                .tag(num)
                            
                        } placeholder: {
                            ZStack {
                                ProgressView()
                                Color.gray.opacity(0.2)
                            }
                            
                        }
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle())
                .onReceive(timer) { _ in
                    withAnimation {
                        if currentHomeIndex < model.homeGalleryData.count - 1 {
                            currentHomeIndex = currentHomeIndex + 1
                        } else {
                            currentHomeIndex = 0
                        }
                    }
                }
                
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
