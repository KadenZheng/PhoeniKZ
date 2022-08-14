//
//  WideStretchedCard.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/12/22.
//

import SwiftUI

struct LeadingWideCard: View {
    
    // MARK: - TEXT IS LEFT ALIGNED
    
    @State var Title: String
    @State var icon: String
    
    var body: some View {
        
        ZStack (alignment: .leading) {
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 20,  height: 60)
                .foregroundColor(.clear)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
            
            HStack {
            
            HStack {
                
                Text("Read Latest:")
                    .font(.title3.weight(.light))
                    .padding(.leading, 27)
                
                Text(Title)
                    .font(.title3.weight(.medium))
                
            }.frame(width: 303, alignment: .leading)
            
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 23, height: 23)
                
            }
            
        }
        
    }
}

struct WideStretchedCard_Previews: PreviewProvider {
    static var previews: some View {
        LeadingWideCard(Title: "Phoenix Post", icon: "newspaper")
    }
}
