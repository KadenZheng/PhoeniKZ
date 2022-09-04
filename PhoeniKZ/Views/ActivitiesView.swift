//
//  ActivitiesView.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/12/22.
//

import SwiftUI

struct ActivitiesView: View {
    
    @EnvironmentObject var model: Manager
    @Binding var selectedTab: Int
    
    var body: some View {
        
        NavigationView {
            
            GeometryReader { geo in
                
                ScrollView (showsIndicators: false) {
                    
                    VStack (alignment: .leading, spacing: 20) {
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: 70)
                        
                        // MARK: - Schoolwide Events Scroll
                        
                        VStack (alignment: .leading) {
                            
                            Text("Schoolwide Events")
                                .font(.title.weight(.semibold))
                                .padding(.horizontal)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    ForEach(model.events) {
                                        event in
                                        NavigationLink {
                                            EventDetailView(title: event.title, caption: event.caption, image: event.image, location: event.location, time: event.time, contact: event.contact, description: event.description)
                                        } label: {
                                            HomeViewCard(image: event.image, title: event.title, caption: event.caption, blur: true, async: true, imageURL: event.imageURL, widthOffset: 90, heightOffset: -10)
                                                .padding(.leading)
                                                .padding([.bottom, .top, .trailing], 10)
                                        }
                                        .accentColor(.black)
                                    }
                                    
                                }
                            }
                        }
                        
                        Divider()
                            .frame(width: UIScreen.main.bounds.width - 40)
                        
                        // MARK: - School Life Scroll
                        VStack (alignment: .leading) {
                            
                            HStack {
                                
                                Text("Bulletin")
                                    .font(.title2.weight(.semibold))
                                
                            }.padding(.horizontal)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    NavigationLink {
                                        BulletinDetailView(selectedCategory: "New")
                                    } label: {
                                        HStack {
                                            
                                            HomeViewCard(image: "New", title: "New", blur: true, async: false, widthOffset: -60, heightOffset: -60)
                                                .padding(.leading)
                                                .padding([.bottom, .top, .trailing], 10)
                                        }
                                    }
                                    
                                    NavigationLink {
                                        BulletinDetailView(selectedCategory: "Club/Sports")
                                    } label: {
                                        HStack {
                                            
                                            HomeViewCard(image: "Sports", title: "Clubs/Sports", blur: true, async: false, widthOffset: -60, heightOffset: -60)
                                                .padding(.leading)
                                                .padding([.bottom, .top, .trailing], 10)
                                        }
                                    }
                                    
                                    NavigationLink {
                                        BulletinDetailView(selectedCategory: "Parents")
                                    } label: {
                                        HStack {
                                            
                                            HomeViewCard(image: "Parents", title: "Parents", blur: true, async: false, widthOffset: -60, heightOffset: -60)
                                                .padding(.leading)
                                                .padding([.bottom, .top, .trailing], 10)
                                        }
                                    }
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
                            
                            // MARK: - Club Meetings
                            
                            ForEach (model.bulletinData) { bulletin in
                                
                                if bulletin.meetingDate != nil {
                                    
                                    HStack {
                                        
                                        Text(bulletin.title)
                                            .font(.subheadline)
                                        
                                        Spacer()
                                        
                                        Text(bulletin.meetingDate!)
                                            .font(.subheadline)
                                        
                                    }.frame(width: UIScreen.main.bounds.width - 50)
                                }
                                
                            }
                            
                            
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
            .navigationBarHidden(true)
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

//struct ActivitiesView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivitiesView(selectedTab: 1)
//    }
//}
