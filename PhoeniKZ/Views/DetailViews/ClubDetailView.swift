//
//  ClubDetailView.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/21/22.
//

import SwiftUI

struct ClubDetailView: View {
    
    @EnvironmentObject var model: Manager
    
    @State var clubAdvisor: String
    @State var meetingDate: String
    @State var description: String
    @State var image: String
    @State var clubName: String
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .foregroundColor(.black)
            
            VStack {
                // Image Bar
                
                ZStack {
                    
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .clipped()
                        .blur(radius: 1.5)
                        .scaleEffect(1.01)
                    
                    VStack (alignment: .leading, spacing: 10) {
                        
                        Text(clubName)
                            .foregroundColor(.white)
                            .font(.largeTitle.weight(.bold))
                            .shadow(color: .black, radius: 2, x: 1, y: 1)
                        
                    }
                    .frame(width: UIScreen.main.bounds.size.width - 50, height: 200, alignment: .bottomLeading)
                }
                .padding(.bottom, 25)
                
                // Contact
                
                VStack (alignment: .leading, spacing: 15) {
                    HStack {
                        
                        Image(systemName: "person.crop.rectangle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.trailing)
                            .foregroundColor(.white)
                        
                        Text("Advisor: ")
                            .font(.title3.weight(.medium))
                            .foregroundColor(.white)
                        
                        Text(clubAdvisor)
                            .font(.title3.weight(.regular))
                            .foregroundColor(.white)
                        
                    }
                    
                    HStack {
                        
                        Image(systemName: "calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.trailing)
                            .foregroundColor(.white)
                        
                        Text("Meeting Date: ")
                            .font(.title3.weight(.medium))
                            .foregroundColor(.white)
                        Text(meetingDate)
                            .font(.title3.weight(.regular))
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(.white)
                        
                    }
                    
                }
                .frame(width: UIScreen.main.bounds.width - 50, alignment: .leading)
                
                Divider()
                    .overlay(.white)
                    .padding([.top, .bottom])
                
                // Info
                
                Group {
                    
                    Text("Information")
                        .font(.title3.weight(.semibold))
                        .frame(width: UIScreen.main.bounds.width - 50, alignment: .leading)
                        .foregroundColor(.white)
                    
                    ScrollView {
                        
                        Text(description)
                            .padding(.bottom)
                            .multilineTextAlignment(.leading)
                            .lineLimit(13)
                            .foregroundColor(.white)
                        
                    }
                    .frame(width: UIScreen.main.bounds.width - 50, height: 350, alignment: .topLeading)
                    .padding(.bottom, 35)
                    
                }
                .padding(.horizontal, 38)
                
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct ClubDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ClubDetailView(clubAdvisor: "Dr. Jarocki", meetingDate: "8/24/2022", description: "Sample DescriptionSample DescriptionSample DescriptionSample DescriptionSample DescriptionSample DescriptionSample DescriptionSample Description", image: "frisbees", clubName: "Speech/Debate")
    }
}
