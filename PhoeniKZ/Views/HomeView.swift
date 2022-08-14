//
//  ContentView.swift
//  PhoeniKZ
//
//  Created by Kaden Zheng on 8/10/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: Manager
    @Binding var selectedTab: Int
    
    var body: some View {
        
        NavigationView {
            
            GeometryReader { geo in
                
                ScrollView (showsIndicators: false) {
                    
                    VStack {
                        
                        Group {
                            
                            // MARK: - Image Bar
                            ImageBar(image: "night_school", titleText: "University High", subtitleText: formatDate())
                                .padding(.bottom, 40)
                            
                            // MARK: - Read Latest
                            ForEach(model.phoenixPost) { post in
                                NavigationLink {
                                    PhoenixPostView(content: post.content, image: post.image, title: post.title, author: post.author, publishingDate: post.publishingDate)
                                } label: {
                                    LeadingWideCard(Title: "Phoenix Post", icon: "newspaper")
                                }.scaledToFill()
                                    .accentColor(.black)
                            }
                            
                            // MARK: - Club Sign In
                            
                            NavigationLink {
                                SignInView(name: "", code: "", signInName: "Club", image: "night_school")
                            } label: {
                                CenteredWideCard(title: "Club Sign In", icon1: "arrowtriangle.right.fill", icon2: "arrowtriangle.left.fill")
                                    .padding(.bottom)
                            }.accentColor(.black)
                            
                        }
                        
                        // MARK: - Events Scroll
                        
                        VStack (alignment: .leading) {
                            
                            HStack {
                                
                                Text("Upcoming Events")
                                    .font(.title2.weight(.bold))
                                
                                Button {
                                    selectedTab = 1
                                } label: {
                                    Text("See all events")
                                        .font(.callout)
                                        .padding(.leading, 40)
                                    Image(systemName: "arrow.right.circle")
                                        .resizable()
                                        .frame(width: 17, height: 17)
                                }
                                .accentColor(.black)
                            }
                            .padding(.horizontal)
                            .padding(.bottom, -10)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    ForEach(model.events) {
                                        event in
                                        NavigationLink {
                                            EventDetailView(title: event.title, caption: event.caption, image: event.image, location: event.location, time: event.time, contact: event.contact, description: event.description)
                                        } label: {
                                            HomeViewCard(image: event.image, title: event.title, caption: event.caption, rectangleWidth: (geo.size.width+75)/2, rectangleHeight: (geo.size.width-25)/2)
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
                                
                                Text("School Life")
                                    .font(.title2.weight(.bold))
                                
                            }.padding(.horizontal)
                                .padding(.bottom, -10)
                            
                            ScrollView (.horizontal) {
                                
                                HStack {
                                    
                                    HomeViewCard(image: "mosaic_phoenix-transparent", title: "Title", rectangleWidth: (geo.size.width-10)/2, rectangleHeight: (geo.size.width-80)/2)
                                        .padding(.leading)
                                        .padding([.bottom, .top, .trailing], 10)
                                    
                                }
                            }
                        }
                        
                        Divider()
                        
                        // MARK: - Links
                        
                        Group {
                            
                            Text("Powerschool")
                                .font(.title3)
                            
                            Divider()
                            
                            Text("Google Sites")
                                .font(.title3)
                            
                            Divider()
                            
                            HStack (spacing: 13) {
                                RoundedContactCard(image: "phone.circle.fill", rectangleWidth: 160)
                                
                                RoundedContactCard(image: "envelope.circle.fill", rectangleWidth: 160)
                                
                            }.padding(.top)
                            
                        }
                        
                    }
                }
                .edgesIgnoringSafeArea(.top)
                
            }
            .navigationBarHidden(true)
        }
    }
}

func formatDate() -> String {
    
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    
    return dateFormatter.string(from: date)
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(selectedTab: 0)
//            .environmentObject(Manager())
//    }
//}
