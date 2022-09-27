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
    @State var blur: Bool
    @State var async: Bool
    @State var imageURL: String?

    var screenWidth: CGFloat {
       UIScreen.main.bounds.width
    }
    
    @State var widthOffset: CGFloat = 0
    @State var heightOffset: CGFloat = 0
    
    var body: some View {

        ZStack {

            Rectangle()
                .frame(width: (screenWidth + widthOffset) / 2, height: abs(screenWidth + heightOffset) / 2)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 5, x: 0, y: 0)
                .foregroundColor(.white)
            
            if async {
                AsyncImage(url: URL(string: imageURL!)) { asyncImage in
                
                        asyncImage
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(10)
                            .frame(width: (screenWidth + widthOffset) / 2, height: abs(screenWidth + heightOffset) / 2)
                            .blur(radius: 1)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                } placeholder: {
                    ZStack {

                        Color.purple.opacity(0.1)
                        
                        ProgressView()
                        
                    }
                }
            } else {
                if blur {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(10)
                        .frame(width: (screenWidth + widthOffset) / 2, height: abs(screenWidth + heightOffset) / 2)
                        .blur(radius: 1)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                } else if blur == false {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(10)
                        .frame(width: (screenWidth + widthOffset) / 2, height: abs(screenWidth + heightOffset) / 2)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }

            ZStack (alignment: .bottomLeading) {

                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: (screenWidth + widthOffset) / 2, height: abs(screenWidth + heightOffset) / 2)
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
        HomeViewCard(image: "mosaic_phoenix-transparent", title: "Title", caption: "Caption", blur: true, async: true, imageURL: "https://kadenzheng.github.io/PhoeniKZ/IMG_1612.jpg", widthOffset: 165, heightOffset: 210)
    }
}
