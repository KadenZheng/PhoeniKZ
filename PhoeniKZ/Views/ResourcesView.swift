//
//  ResourcesView.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/12/22.
//

import SwiftUI

struct ResourcesView: View {
    
    @EnvironmentObject var model: Manager
    @Binding var selectedTab: Int
    
    var body: some View {
        
        NavigationView {
            
            GeometryReader { geo in
                
                ScrollView (showsIndicators: false) {
                    
                    VStack (spacing: 15) {
                        
                        // MARK: - Image Bar
                        ImageBar(image: "night_school", titleText: "Resources", clipped: true, async: false)
                            .frame(width: UIScreen.main.bounds.width, height: 240, alignment: .topLeading)
                            .edgesIgnoringSafeArea(.top)
                        
                        // MARK: - ASC Sign In
                        
                        NavigationLink {
                            SignInView(name: "", code: "", signInName: "ASC", image: "night_school")
                        } label: {
                            CenteredWideCard(title: "ASC Sign In")
                                .padding(.bottom)
                        }.accentColor(.black)
                            .padding(.top, UIScreen.main.bounds.width/10)
                        
                        Divider()
                        
                        // MARK: - Academic Resources
                        
                        VStack (alignment: .leading) {
                            
                            HStack {
                                
                                Text("Academics")
                                    .font(.title2.weight(.semibold))
                                
                            }.padding(.horizontal)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    Link(destination: URL(string: "https://aptests.wufoo.com/forms/pmss5vs0bov44k/")!) {
                                        HomeViewCard(image: "AP", title: "AP Exam Orders", blur: true, async: false, widthOffset: -60, heightOffset: -60)
                                            .padding(.leading)
                                            .padding([.bottom, .top, .trailing], 10)
                                    }.accentColor(.black)
                                    
                                    Link(destination: URL(string: "http://uhsfresno.com/documents/Counseling/APExamOrdering.pdf")!) {
                                        HomeViewCard(image: "uhs.medallion.red", title: "AP Exam F.A.Q.'s", blur: true, async: false, widthOffset: -60, heightOffset: -60)
                                            .padding(.leading)
                                            .padding([.bottom, .top, .trailing], 10)
                                    }.accentColor(.black)
                                    
                                    Link(destination: URL(string: "http://uhsfresno.com/collegecareer.html")!) {
                                        HomeViewCard(image: "CollegeBanner", title: "College & Career", blur: true, async: false, widthOffset: -60, heightOffset: -60)
                                            .padding(.leading)
                                            .padding([.bottom, .top, .trailing], 10)
                                    }.accentColor(.black)
                                    
                                    Link(destination: URL(string: "http://uhsfresno.com/documents/Counseling/SchoolProfile2021-22.pdf")!) {
                                        HomeViewCard(image: "uhsMedallion", title: "School Profile", blur: false, async: false, widthOffset: -60, heightOffset: -60)
                                            .padding(.leading)
                                            .padding([.bottom, .top, .trailing], 10)
                                    }.accentColor(.black)
                                    
                                }
                            }
                        }
                        
                        // MARK: - Mental Health
                        
                        VStack (alignment: .leading) {
                            
                            HStack {
                                
                                Text("Mental Health")
                                    .font(.title2.weight(.semibold))
                                
                            }.padding(.horizontal)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    Link(destination: URL(string: "http://uhsfresno.com/counseling.html")!) {
                                        HomeViewCard(image: "CounselingOffice", title: "Counseling", blur: false, async: false, widthOffset: -60, heightOffset: -60)
                                            .padding(.leading)
                                            .padding([.bottom, .top, .trailing], 10)
                                    }.accentColor(.black)
                                    
                                    Link(destination: URL(string: "https://sites.google.com/mail.fresnostate.edu/uhsvirtualcalmingroom")!) {
                                        HomeViewCard(image: "VirtualCalming", title: "Virtual Calming", blur: false, async: false, widthOffset: -60, heightOffset: -60)
                                            .padding(.leading)
                                            .padding([.bottom, .top, .trailing], 10)
                                    }.accentColor(.black)
                                    
                                    Link(destination: URL(string: "http://uhsfresno.com/peermentors.html")!) {
                                        HomeViewCard(image: "PeerMentor", title: "Peer Mentors", blur: true, async: false, widthOffset: -60, heightOffset: -60)
                                            .padding(.leading)
                                            .padding([.bottom, .top, .trailing], 10)
                                    }.accentColor(.black)
                                    
                                }
                            }
                        }
                        
                        // MARK: - Counselors
                        
                        VStack (alignment: .leading) {
                            
                            HStack {
                                
                                Text("Counselors")
                                    .font(.title2.weight(.semibold))
                                
                            }.padding(.horizontal)
                            
                            ScrollView (.horizontal) {
                                
                                HStack {
                                    
                                    Link(destination: URL(string: "mailto:rociof@mail.fresnostate.edu")!) {
                                        HomeViewCard(image: "FERNANDEZ_ROCIO", title: "Rocio Fernandez", caption: "A-K Counselor", blur: false, async: false, widthOffset: -60, heightOffset: -60)
                                            .padding(.leading)
                                            .padding([.bottom, .top, .trailing], 10)
                                    }.accentColor(.black)
                                    
                                    Link(destination: URL(string: "mailto:gbird@mail.fresnostate.edu")!) {
                                        HomeViewCard(image: "BIRD_GENI", title: "Geni Bird", caption: "L-Z Counselor", blur: false, async: false, widthOffset: -60, heightOffset: -60)
                                            .padding(.leading)
                                            .padding([.bottom, .top, .trailing], 10)
                                    }.accentColor(.black)
                                    
                                }
                            }
                        }
                        
                    }
                }
                .edgesIgnoringSafeArea(.top)
            }
            .navigationBarHidden(true)
            
        }
    }
}

//
//struct ResourcesView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResourcesView(selectedTab: )
//    }
//}
