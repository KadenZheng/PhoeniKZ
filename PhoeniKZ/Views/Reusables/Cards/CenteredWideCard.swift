//
//  CenteredWideCard.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/12/22.
//

import SwiftUI

struct CenteredWideCard: View {
    
    @State var title: String
    @State var icon1: String
    @State var icon2: String
    
    var body: some View {
        
        ZStack (alignment: .center) {
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 20,  height: 60)
                .foregroundColor(.clear)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
            
            HStack {
                
                Image(systemName: icon1)
                    .resizable()
                    .frame(width: 23, height: 23)
                
                HStack {
                    
                    Text(title)
                        .font(.title3.weight(.medium))
                    
                }.frame(width: 250, alignment: .center)
                
                Image(systemName: icon2)
                    .resizable()
                    .frame(width: 23, height: 23)
                
            }
        }
        
    }
}

struct CenteredWideCard_Previews: PreviewProvider {
    static var previews: some View {
        CenteredWideCard(title: "Club Sign In", icon1: "arrowtriangle.right.fill", icon2: "arrowtriangle.left.fill")
    }
}
