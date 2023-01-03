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
    @State private var showPopUp: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            GeometryReader { geo in
                
                ZStack {
                    ZStack {
                        
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            .foregroundColor(.black)
                        
                        ScrollView (showsIndicators: false) {
                            
                            VStack (alignment: .leading, spacing: 20) {
                                
                                ZStack (alignment: .topTrailing) {
                                    
                                    ImageBar(image: "MOTASeasons", titleText: "Student Spotlight", subtitleText: formatDate(), clipped: true, async: false, activitiesGallery: true, homeGallery: false)
                                        .edgesIgnoringSafeArea(.top)
                                        .frame(width: UIScreen.main.bounds.width, height: 240, alignment: .topLeading)
                                        .padding(.bottom)
                                        .padding(.top, -70)
                                    
                                    Button {
                                        withAnimation(.linear(duration: 0.3)) {
                                            showPopUp.toggle()
                                        }
                                    } label: {
                                        Image(systemName: "info.circle")
                                            .foregroundColor(.white)
                                            .shadow(color: .black, radius: 1, x: 0.5, y: 0.5)
                                    }
                                    .padding(.trailing)
                                    
                                    
                                }
                                
                                
                                // MARK: - Schoolwide Events Scroll
                                
                                VStack (alignment: .leading) {
                                    
                                    Text("Events Spotlight")
                                        .foregroundColor(.white)
                                        .font(.title.weight(.semibold))
                                        .padding(.horizontal)
                                    
                                    ScrollView (.horizontal, showsIndicators: false) {
                                        
                                        HStack {
                                            
                                            ForEach(model.events) {
                                                event in
                                                NavigationLink {
                                                    EventDetailView(title: event.title, caption: event.caption, image: event.image, location: event.location, time: event.time, contact: event.contact, description: event.description, asyncBool: true, imageURLE: event.imageURL)
                                                } label: {
                                                    HomeViewCard(image: event.image, title: event.title, caption: event.caption, blur: true, async: true, imageURL: event.imageURL, widthOffset: 90, heightOffset: -10)
                                                        .padding(.leading)
                                                        .padding([.bottom, .top, .trailing], 10)
                                                }
                                                .accentColor(.white)
                                            }
                                            
                                        }
                                    }
                                }
                                
                                // MARK: - School Life Scroll
                                VStack (alignment: .leading) {
                                    
                                    HStack {
                                        
                                        Text("Bulletin")
                                            .foregroundColor(.white)
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
                                        .overlay(.white)
                                    
                                    Text("Dates Spotlight")
                                        .foregroundColor(.white)
                                        .font(.headline.weight(.medium))
                                        .padding(.vertical, 5)
                                    
                                    HLine().stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                        .foregroundColor(.white)
                                        .frame(width: UIScreen.main.bounds.width - 40)
                                    
                                    // MARK: - Club Meetings
                                    
                                    ForEach (model.bulletinData) { bulletin in
                                        
                                        if bulletin.meetingDate != nil {
                                            
                                            VStack {
                                                
                                                HStack {
                                                    
                                                    Text(bulletin.title)
                                                        .font(.subheadline)
                                                        .foregroundColor(.white)
                                                    
                                                    Spacer()
                                                    
                                                    Text(bulletin.meetingDate!)
                                                        .font(.subheadline)
                                                        .foregroundColor(.white)
                                                    
                                                }.frame(width: UIScreen.main.bounds.width - 50)
                                                
                                                HLine().stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                                    .foregroundColor(.white)
                                                    .frame(width: UIScreen.main.bounds.width - 40)
                                            }
                                            
                                        }
                                        
                                    }
                                    
                                }
                                .padding(.bottom, 150)
                            }
                            .edgesIgnoringSafeArea(.top)
                        }
                    }
                    
                    ActivitiesViewPopup(show: $showPopUp)
                    
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
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

