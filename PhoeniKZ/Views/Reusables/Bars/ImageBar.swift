//
//  ImageBar.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/11/22.
//

import SwiftUI

struct ImageBar: View {
    
    @State var image: String
    @State var titleText: String
    @State var subtitleText: String?
    
    var body: some View {
        
        ZStack {
            
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(height: 250)
                .edgesIgnoringSafeArea(.all)
                .scaleEffect(1.01)
                .blur(radius: 1.5)
            
            VStack (alignment: .leading, spacing: 10) {
                
                Text(titleText)
                    .foregroundColor(.white)
                    .font(.largeTitle.weight(.bold))
                    .shadow(color: .black, radius: 2, x: 1, y: 1)
                    .frame(width: UIScreen.main.bounds.size.width - 20, height: 200, alignment: .bottomLeading)
                
                if subtitleText != nil {
                    Text(subtitleText!)
                        .font(.title3.weight(.medium))
                        .foregroundColor(Color(red: 210/255, green: 210/255, blue: 210/255))
                        .shadow(color: .black, radius: 2, x: 1, y: 1)
                }
            }.padding(.leading)
        }
        .padding(.bottom, 40)
    }
}

struct ImageBar_Previews: PreviewProvider {
    static var previews: some View {
        ImageBar(image: "night_school", titleText: "University High", subtitleText: "8/12/2022")
    }
}
