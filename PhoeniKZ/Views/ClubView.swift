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
        
        ScrollView {
            
            LazyVStack (alignment: .center) {
                    
                    LazyVGrid (columns: [GridItem(.flexible(), spacing: -10, alignment: .top), GridItem(.flexible(), spacing: -10, alignment: .top)], alignment: .center, spacing: 40, pinnedViews: []) {
                        
                        ForEach(model.clubs) { club in
                            
                            NavigationLink {
                                ClubDetailView(clubAdvisor: club.advisor, meetingDate: club.meetingDate, description: "Description", image: model.randomImages[random()], clubName: club.name)
                            } label: {
                                HomeViewCard(image: model.randomImages[random()], title: club.name, caption: club.advisor, blur: true, async: false, widthOffset: -80, heightOffset: -80)
                            }
                        }
                        
                    }
                }
        }
        .navigationTitle("Clubs")
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
