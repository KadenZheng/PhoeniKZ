//
//  HomeViewCard.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/10/22.
//

import SwiftUI

struct HomeViewCard: View {
    
    @State var image: String
    @State var title: String
    @State var caption: String?
    
    @State var rectangleWidth: CGFloat = 0
    @State var rectangleHeight: CGFloat = 0
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
            
                .frame(width: abs(rectangleWidth), height: abs(rectangleHeight))
                .cornerRadius(20)
                .shadow(color: .gray, radius: 5, x: 0, y: 0)
                .foregroundColor(.white)
                
            
            Image(image)
                .resizable()
                .scaledToFill()
                .cornerRadius(10)
                .frame(width: abs(rectangleWidth), height: abs(rectangleHeight))
                .blur(radius: 1)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            
            ZStack (alignment: .bottomLeading) {
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: abs(rectangleWidth), height: abs(rectangleHeight))
                    .cornerRadius(20)
                
                VStack (alignment: .leading) {
                    
                    Text(title)
                        .foregroundColor(.white)
                        .bold()
                        .font(.headline)
                        .padding(.bottom, 2)
                        .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                    
                    if caption != nil {
                    Text(caption!)
                            .font(.callout)
                            .foregroundColor(.white)
                        .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                    }
                }.padding(.leading, 15)
                 .padding(.bottom, 20)
            }
        }
    }
}


struct HomeViewCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewCard(image: "mosaic_phoenix-transparent", title: "Title", caption: "Caption", rectangleWidth: 165, rectangleHeight: 210)
    }
}
