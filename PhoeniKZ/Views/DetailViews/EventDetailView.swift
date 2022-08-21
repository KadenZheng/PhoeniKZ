//
//  DetailView.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/13/22.
//

import SwiftUI

struct EventDetailView: View {
    
    @State var title: String
    @State var caption: String
    @State var image: String
    @State var location: String?
    @State var time: String
    @State var contact: String?
    @State var description: String
    
    var body: some View {
        
        VStack (alignment: .center) {
            
            // MARK: - Image Bar
            
            ImageBar(image: image, titleText: title, subtitleText: caption, clipped: false)
                .frame(width: UIScreen.main.bounds.width, height: 250, alignment: .bottom)
                .edgesIgnoringSafeArea(.top)
                .padding(.bottom, 30)
                
            
            VStack (alignment: .leading) {
                
                VStack (alignment: .leading) {
                    
                    // MARK: - Information
                    
                    VStack (alignment: .leading, spacing: 17) {
                        
                        // Event Information/Date
                        
                        if location != nil {
                            
                            HStack {
                                
                                Image(systemName: "calendar")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .padding(.trailing)
                                
                                VStack (alignment: .leading) {
                                    
                                    Text("Location:  \(location!)")
                                        .font(.title3.weight(.semibold))
                                    
                                    Text(time)
                                        .font(.subheadline)
                                        .padding(.top, -13)
                                    
                                }
                            }
                            
                        } else {
                            
                            HStack {
                                
                                Image(systemName: "calendar")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .padding(.trailing)
                                
                                Text(time)
                                    .font(.title3.weight(.semibold))
                            }
                            
                        }
                        
                        if contact != nil {
                            
                            // Contact Information
                            HStack (alignment: .bottom) {
                                
                                Image(systemName: "person.2.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45, height: 45)
                                    .padding(.trailing, 10)
                                    .padding(.bottom, -5)
                                
                                
                                
                                HStack (alignment: .bottom) {
                                    
                                    Text("Contact:")
                                        .font(.title3.weight(.regular))
                                    
                                    Text(contact!)
                                        .font(.headline.weight(.medium))
                                        .padding(.bottom, 1)
                                    
                                }
                                
                            }
                        }
                        
                    }
                    .padding(.leading, 38)
                    
                    Divider()
                        .padding([.top, .bottom])
                    
                    
                }.edgesIgnoringSafeArea(.top)
                
                Group {
                    
                    Text("Information")
                        .font(.title3.weight(.semibold))
                    
                    ScrollView {
                        
                        Text(description)
                            .padding(.bottom)
                            .multilineTextAlignment(.leading)
                            .lineLimit(13)
                        
                    }
                    .frame(width: UIScreen.main.bounds.width - 50, height: 350, alignment: .topLeading)
                    .padding(.bottom, 35)
                    
                }
                .padding(.horizontal, 38)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(title: "Magic of the Arts", caption: "All School", image: "red_flowers", location: "nil", time: "All Day", contact: "nil", description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean et est a dui semper facilisis. Pellentesque placerat elit a nunc. Nullam tortor odio, rutrum quis, egestas ut, posuere sed, felis. Vestibulum placerat feugiat nisl. Suspendisse lacinia, odio non feugiat vestibulum, sem erat blandit metus, ac nonummy magna odio pharetra felis. Vivamus vehicula velit non metus faucibus auctor. Nam sed augue. Donec orci. Cras eget diam et dolor dapibus sollicitudin. In lacinia, tellus vitae laoreet ultrices, lectus ligula dictum dui, eget condimentum velit dui vitae ante. Nulla nonummy augue nec pede. Pellentesque ut nulla. Donec at libero. Pellentesque at nisl ac nisi fermentum viverra. Praesent odio. Phasellus tincidunt diam ut ipsum. Donec eget est.")
    }
}
