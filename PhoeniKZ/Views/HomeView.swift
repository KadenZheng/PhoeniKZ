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
            
            ZStack {
//                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .foregroundColor(.black)

//                
//                
//                Image("background1")
//                    .resizable()
//                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//                    .scaleEffect(1.1)
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
                
                ScrollView (showsIndicators: false) {
                    
                    VStack {
                        
                        Group {
                            
                            // MARK: - Image Bar
                            ImageBar(image: "night_school", titleText: "University High", subtitleText: formatDate(), clipped: true, async: false)
                                .frame(width: UIScreen.main.bounds.width, height: 240, alignment: .topLeading)
                                .edgesIgnoringSafeArea(.top)
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
                                SignInView(clubSelection: "ASB", name: "", code: "", signInName: "Club", image: "night_school", gradeLevel: "")
                            } label: {
                                CenteredWideCard(title: "Club Sign In", icon1: "arrowtriangle.right.fill", icon2: "arrowtriangle.left.fill")
                                    .padding(.bottom)
                            }.accentColor(.black)
                            
                        }
                        
                        // MARK: - Events Scroll
                        
                        VStack (alignment: .leading) {
                            
                            HStack {
                                
                                Text("Upcoming Events")
                                    .foregroundColor(.white)
                                    .font(.title2.weight(.bold))
                                
                                Button {
                                    selectedTab = 1
                                } label: {
                                    Text("See all events")
                                        .foregroundColor(.white)
                                        .font(.callout)
                                        .padding(.leading, 40)
                                    Image(systemName: "arrow.right.circle")
                                        .resizable()
                                        .frame(width: 17, height: 17)
                                        .foregroundColor(.white)
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
                                            EventDetailView(title: event.title, caption: event.caption, image: event.image, location: event.location, time: event.time, contact: event.contact, description: event.description, asyncBool: true, imageURLE: event.imageURL)
                                        } label: {
                                            HomeViewCard(image: event.image, title: event.title, caption: event.caption, blur: true, async: true, imageURL: event.imageURL, widthOffset: 75, heightOffset: -25)
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
                                    .foregroundColor(.white)
                                    .font(.title2.weight(.bold))
                                
                            }.padding(.horizontal)
                                .padding(.bottom, -10)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    // MARK: - Faculty View
                                    NavigationLink {
                                        FacultyListView()
                                    } label: {
                                        HomeViewCard(image: "mosaic_phoenix-black", title: "Faculty", blur: true, async: false, widthOffset: -10, heightOffset: -80)
                                            .padding(.leading)
                                            .padding([.bottom, .top, .trailing], 10)
                                    }
                                    
                                    // MARK: - Club View
                                    NavigationLink {
                                        ClubView()
                                    } label: {
                                        HomeViewCard(image: "red_flowers", title: "Clubs", blur: true, async: false, widthOffset: -10, heightOffset: -80)
                                            .padding(.leading)
                                            .padding([.bottom, .top, .trailing], 10)
                                    }
                                    
                                }
                            }
                        }
                        
                        Divider()
                        
                        // MARK: - Links
                        
                        Group {
                            
                            Link(destination: URL(string: "https://apps.apple.com/us/app/powerschool-mobile/id973741088")!) {
                                Text("Powerschool")
                                    .foregroundColor(.white)
                                    .font(.title3)
                            }.accentColor(.black)
                            
                            Divider()
                            
                            Link(destination: URL(string: "http://uhsfresno.com/courses.html")!) {
                                Text("Google Sites")
                                    .foregroundColor(.white)
                                    .font(.title3)
                            }.accentColor(.black)
                            
                            
                            Divider()
                            
                            HStack (spacing: 13) {
                                Link(destination: URL(string: "tel:5592788263")!) {
                                    RoundedContactCard(image: "phone.circle.fill", rectangleWidth: 160)
                                }
                                
                                Link(destination: URL(string: "mailto:uhsattendance@gmail.com")!) {
                                    RoundedContactCard(image: "envelope.circle.fill", rectangleWidth: 160)
                                }
                                
                            }.padding(.top)
                                .accentColor(.black)
                                .padding(.bottom, 80)
                            
                        }
                        
                    }
                }
                .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
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

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(selectedTab: 0)
//            .environmentObject(Manager())
//    }
//}
