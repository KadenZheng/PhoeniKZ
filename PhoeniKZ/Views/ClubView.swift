//
//  ClubView.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/19/22.
//

import SwiftUI

struct ClubView: View {
    
    @EnvironmentObject var model: Manager
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .foregroundColor(.black)
            
            ScrollView {
                
                LazyVStack (alignment: .center) {
                    
                    LazyVGrid (columns: [GridItem(.flexible(), spacing: -10, alignment: .top), GridItem(.flexible(), spacing: -10, alignment: .top)], alignment: .center, spacing: 40, pinnedViews: []) {
                        
                        ForEach(model.clubs) { club in
                            
                            NavigationLink {
                                ClubDetailView(clubAdvisor: club.advisor, meetingDate: club.meetingDate, description: "Description", image: club.image, clubName: club.name)
                            } label: {
                                HomeViewCard(image: club.image, title: club.name, caption: club.advisor, blur: true, async: false, widthOffset: -80, heightOffset: -80)
                            }
                        }
                        
                    }
                }
                .padding(.bottom, 120)
                .padding(.top, 130)
            }
            
        }.navigationTitle("Clubs")
            
    }
}

func random() -> Int {
    return Int.random(in: 0..<6)
}

struct ClubView_Previews: PreviewProvider {
    static var previews: some View {
        ClubView()
            .environmentObject(Manager())
    }
}
