//
//  FacultyCard.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/10/22.
//

import SwiftUI

struct FacultyCard: View {
    
    @EnvironmentObject var model: Manager
    
    @State var image: String
    @State var name: String
    @State var position: String
    
    var body: some View {
        
        ZStack (alignment: .leading) {
            
            // Background Rectangle Outline
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 50, height: 90)
                .foregroundColor(.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
            
            HStack {
                
                // Faculty Image
                
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 100, height: 100)
                
                // Faculty Info
                
                VStack (alignment: .leading, spacing: 10) {
                    Text(name)
                        .bold()
                        .font(.headline)
                        .lineLimit(2)
                    
                    Text(position)
                        .font(.subheadline)
                        .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                }
                .frame(width: 159, alignment: .leading)
                .padding(.trailing, 1)
                
                ZStack {
                    
                    // Mail Icon
                    
                    Circle()
                        .foregroundColor(.black)
                        .frame(width: 45, height: 45)
                    
                    Image(systemName: "envelope.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25).foregroundColor(Color.white)
                    
                }
                
            }
            
        }
        
    }
}

struct FacultyCard_Previews: PreviewProvider {
    static var previews: some View {
        FacultyCard(image: "mosaic_phoenix-black", name: "Aaron Morgan", position: "Vice Principal")
    }
}
