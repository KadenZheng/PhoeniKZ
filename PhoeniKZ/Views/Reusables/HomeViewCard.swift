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
    @State var caption: String
    
    @State var rectangleWidth: CGFloat
    @State var rectangleHeight: CGFloat
    @State var imageWidth: CGFloat
    @State var imageHeight: CGFloat
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
            
                .frame(width: rectangleWidth, height: rectangleHeight)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 5, x: 0, y: 0)
                .foregroundColor(.white)
                
            
            Image(image)
                .resizable()
                .scaledToFill()
                .cornerRadius(10)
                .frame(width: imageWidth, height: imageHeight)
                .clipped()
                .blur(radius: 4)
            
            
            ZStack (alignment: .bottomLeading) {
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: rectangleWidth, height: rectangleHeight)
                    .cornerRadius(20)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 20)
//                            .stroke(Color.black, lineWidth: 2.5)
//                    )
                    
                
                VStack (alignment: .leading) {
                    
                    Text("Title")
                        .bold()
                        .font(.title)
                        .padding(.bottom, 2)
                    
                    Text("Caption")
                        .font(.subheadline)
                        .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                    
                }.padding(.leading, 20)
                 .padding(.bottom, 30)
                
            }
        }
    }
}

struct HomeViewCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewCard(image: "mosaic_phoenix-transparent", title: "Title", caption: "Caption", rectangleWidth: 165, rectangleHeight: 210, imageWidth: 150, imageHeight: 200)
    }
}
