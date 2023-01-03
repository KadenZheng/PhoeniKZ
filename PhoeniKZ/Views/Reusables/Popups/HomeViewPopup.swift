//
//  HomeViewPopup.swift
//  PhoeniKZ
//
//  Created by Kaden Zheng on 1/2/23.
//

import SwiftUI

struct HomeViewPopup: View {
    
    @Binding var show: Bool
    
    var body: some View {
        
        ZStack {
            
            if show {
                // MARK: - Pop Up background color
                Color.black.opacity(show ? 0.5 : 0).edgesIgnoringSafeArea(.all)
                
                // MARK: - Pop Up Window
                
                ZStack {
                    
                    VStack (alignment: .center, spacing: 3) {
                        
                        HStack {
                            Text("Designed by:")
                                .font(.subheadline)
                            Text("Kaden Zheng")
                                .font(.subheadline)
                                .bold()
                        }
                        
                        HStack {
                            Text("Developed by:")
                                .font(.subheadline)
                            Text("Kaden Zheng")
                                .font(.subheadline)
                                .bold()
                        }
                        
                        HStack {
                            Text("Maintained by:")
                                .font(.subheadline)
                            Text("Kaden Zheng")
                                .font(.subheadline)
                                .bold()
                        }
                        
                        HStack {
                            Text("Contact:")
                                .font(.caption)
                            Text("KadenZheng@mail.fresnostate.edu")
                                .font(.caption)
                        }
                        .padding(.top, 2)
                    }
                    .padding()
                    .frame(maxWidth: 300)
                    .background(.thinMaterial)
                    .cornerRadius(25)
                    
                    Button(action: {
                        // Dismiss the PopUp
                        withAnimation(.linear(duration: 0.3)) {
                            show = false
                        }
                    }, label: {
                        Rectangle()
                            .opacity(0.000000000000000000000000000000000000000000000000000000000001)
                            .edgesIgnoringSafeArea(.all)
                    }).buttonStyle(PlainButtonStyle())
                }
                .padding(.top, 50)
                
            }
        }
    }
}
