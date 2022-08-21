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
                
                Text("Clubs")
                    .font(.title.weight(.medium))
                    .frame(width: UIScreen.main.bounds.width - 40, alignment: .leading)
                    
                    LazyVGrid (columns: [GridItem(.flexible(), spacing: -10, alignment: .top), GridItem(.flexible(), spacing: -10, alignment: .top)], alignment: .center, spacing: 40, pinnedViews: []) {
                        
                        ForEach(model.clubs) { club in
                            
                            HomeViewCard(image: "frisbees", title: club.name, caption: club.advisor, widthOffset: -80, heightOffset: -80)
                            
                        }
                        
                    }
                }
        }
    }
}

struct ClubView_Previews: PreviewProvider {
    static var previews: some View {
        ClubView()
            .environmentObject(Manager())
    }
}
