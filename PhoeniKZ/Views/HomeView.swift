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
    let width = UIScreen.main.bounds.width
    @State private var showPopUp: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .foregroundColor(.black)
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
                            
                            ZStack (alignment: .topTrailing) {
                                
                                // MARK: - Image Bar
                                ImageBar(image: "night_school", titleText: "University High", subtitleText: formatDate(), clipped: true, async: false, activitiesGallery: false, homeGallery: true)
                                    .frame(width: UIScreen.main.bounds.width, height: 240, alignment: .topLeading)
                                    .edgesIgnoringSafeArea(.top)
                                    .padding(.bottom, 40)
                                
                                Button {
                                    withAnimation(.linear(duration: 0.3)) {
                                        showPopUp.toggle()
                                    }
                                } label: {
                                    Image(systemName: "info.circle")
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 1, x: 0.5, y: 0.5)
                                        .padding(.top, 65)
                                }
                                .padding(.trailing)
                            }
                            
                            
                            // MARK: - Read Latest
                            ForEach(model.phoenixPost) { post in
                                NavigationLink {
                                    PhoenixPostView(content: post.content, imageURL: post.imageURL, title: post.title, author: post.author, publishingDate: post.publishingDate, fullLink: post.fullLink)
                                } label: {
                                    CenteredWideCard(title: "Read Latest: Phoenix Post", icon2: "newspaper")
                                }.scaledToFill()
                                    .accentColor(.white)
                            }
                            
                            // MARK: - Club Sign In
                            
                            NavigationLink {
                                SignInView(clubSelection: "ASB", name: "", code: "", signInName: "Club", image: "night_school", gradeLevel: "")
                            } label: {
                                CenteredWideCard(title: "Club Sign In", icon1: "arrowtriangle.right.fill", icon2: "arrowtriangle.left.fill")
                                    .padding(.bottom)
                            }.accentColor(.white)
                            
                        }
                        
                        // MARK: - Events Scroll
                        
                        VStack (alignment: .leading) {
                            
                            HStack {
                                
                                Text("Upcoming Events")
                                    .foregroundColor(.white)
                                    .font(.title2.weight(.bold))
                                
                                Spacer()
                                
                                Button {
                                    selectedTab = 1
                                } label: {
                                    HStack {
                                        Text("See all events")
                                            .foregroundColor(.white)
                                            .font(.callout)
                                        Image(systemName: "arrow.right.circle")
                                            .resizable()
                                            .frame(width: 17, height: 17)
                                            .foregroundColor(.white)
                                    }
                                }
                                .accentColor(.white)
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
                                        .accentColor(.white)
                                    }
                                    
                                }
                            }
                        }
                        
                        
                        Divider()
                            .frame(width: UIScreen.main.bounds.width - 40)
                            .overlay(.white)
                        
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
                            .frame(width: UIScreen.main.bounds.width - 40)
                            .overlay(.white)
                        
                        // MARK: - Links
                        
                        Group {
                            
                            Link(destination: URL(string: "https://apps.apple.com/us/app/powerschool-mobile/id973741088")!) {
                                Text("Powerschool")
                                    .foregroundColor(.white)
                                    .font(.title3)
                            }
                            
                            Divider()
                                .frame(width: UIScreen.main.bounds.width - 40)
                                .overlay(.white)
                            
                            Link(destination: URL(string: "http://uhsfresno.com/courses.html")!) {
                                Text("Google Sites")
                                    .foregroundColor(.white)
                                    .font(.title3)
                            }
                            
                            
                            Divider()
                                .frame(width: UIScreen.main.bounds.width - 40)
                                .overlay(.white)
                            
                            HStack (spacing: 13) {
                                Link(destination: URL(string: "tel:5592788263")!) {
                                    RoundedContactCard(image: "phone.circle.fill", rectangleWidth: 160)
                                }
                                
                                Link(destination: URL(string: "mailto:uhsattendance@gmail.com")!) {
                                    RoundedContactCard(image: "envelope.circle.fill", rectangleWidth: 160)
                                }
                                
                            }.padding(.top)
                                .accentColor(.black)
                                .padding(.bottom, 90)
                            
                        }
                        
                    }
                }
                .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
                
                HomeViewPopup(show: $showPopUp)
                
            }
            
        }
        .navigationViewStyle(.stack)
        
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
