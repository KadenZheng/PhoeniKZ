//
//  RoundedContactCard.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/12/22.
//

import SwiftUI

struct RoundedContactCard: View {
    
    @State var image: String
    @State var rectangleWidth: CGFloat
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.clear)
                .cornerRadius(50)
                .frame(width: rectangleWidth, height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 2.5))
            
            HStack (alignment: .center, spacing: 10) {
                
                Image(systemName: image)
                    .resizable()
                    .frame(width: 23, height: 23)
                    .foregroundColor(.white)
                
                Text("Contact Us")
                    .font(.headline.weight(.semibold))
                    .foregroundColor(.white)
                
            }
            
        }
        
    }
}

struct RoundedContactCard_Previews: PreviewProvider {
    static var previews: some View {
        RoundedContactCard(image: "newspaper", rectangleWidth: 175)
    }
}
