//
//  ClubDetailView.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/21/22.
//

import SwiftUI

struct ClubDetailView: View {
    
    @EnvironmentObject var model: Manager
    
    @State var clubName: String
    @State var clubAdvisor: String
    @State var meetingDate: String
    @State var description: String
    
    var body: some View {
        
        VStack {
            
            // Image Bar
            
            ImageBar(image: "frisbees", titleText: clubName, clipped: true)
                .frame(width: UIScreen.main.bounds.width, height: 180, alignment: .bottom)
                .edgesIgnoringSafeArea(.top)
                .padding(.bottom, 30)
            
            // Contact
            
            VStack (alignment: .leading, spacing: 15) {
            HStack {
                
                Image(systemName: "person.crop.rectangle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding(.trailing)
                
                Text("Advisor:")
                    .font(.title3.weight(.medium))
                
                Text(clubAdvisor)
                    .font(.title3.weight(.regular))
                
            }
                
            }
        }
        
    }
}

struct ClubDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ClubDetailView(clubName: "Speech/Debate", clubAdvisor: "Dr. Jarocki", meetingDate: "8/24/2022", description: "Sample DescriptionSample DescriptionSample DescriptionSample DescriptionSample DescriptionSample DescriptionSample DescriptionSample Description")
    }
}
