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
    @State var email: String
    
    var body: some View {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            ZStack (alignment: .leading) {
                
                // Background Rectangle Outline
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width - 50, height: 90)
                    .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
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
                        .frame(width: 100, height: 115)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .clipped()
                        .padding(.leading, -5)
                    
                    // Faculty Info
                    
                    VStack (alignment: .leading, spacing: 10) {
                        
                            Text(name)
                                .bold()
                                .foregroundColor(.white)
                                .font(.headline)
                                .lineLimit(2)
                            
                            Text(position)
                                .font(.subheadline)
                                .foregroundColor(.white)
                        
                    }
                    
                    Spacer()
                

                        Link(destination: URL(string: "mailto:\(email)")!) {
                            
                            // Mail Icon
                            
                            ZStack {
                            
                            Circle()
                                .foregroundColor(.black)
                                .frame(width: 45, height: 45)
                            
                            Image(systemName: "envelope.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25).foregroundColor(Color.white)
                                
                            }
                        
                    }
                        .padding(.trailing, 80)
                }
                
            }
            .padding(.leading)
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            ZStack (alignment: .leading) {
                
                // Background Rectangle Outline
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width - 40, height: 90)
                    .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
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
                        .frame(width: 100, height: 115)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .clipped()
                        .padding(.leading, -5)
                    
                    // Faculty Info
                    
                    VStack (alignment: .leading, spacing: 10) {
                        
                        if name.count > 15 {
                            Text(name)
                                .bold()
                                .foregroundColor(.white)
                                .font(.headline)
                                .lineLimit(2)
                                .padding(.bottom, -5)
                            
                            Text(position)
                                .font(.subheadline)
                                .foregroundColor(.white)
                        } else {
                            Text(name)
                                .bold()
                                .foregroundColor(.white)
                                .font(.headline)
                                .lineLimit(2)
                            
                            Text(position)
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        
                    }
                    .frame(width: 159, alignment: .leading)
                    .padding(.trailing, 1)
                    
                    Spacer()
                    
                        Link(destination: URL(string: "mailto:\(email)")!) {
                            
                            // Mail Icon
                            
                            ZStack {
                            
                            Circle()
                                .foregroundColor(.black)
                                .frame(width: 45, height: 45)
                            
                            Image(systemName: "envelope.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25).foregroundColor(Color.white)
                                
                            }.padding(.trailing, UIScreen.main.bounds.width/8.6)
                        
                    }
                        
                    
                }
                
            }.padding(.leading)
        }
        
    }
}

struct FacultyCard_Previews: PreviewProvider {
    static var previews: some View {
        FacultyCard(image: "BIRD_GENI", name: "Geni Bird", position: "Counselor L-Z", email: "gbird@mail.fresnostate.edu")
    }
}
