//
//  PhoenixPostPopup.swift
//  PhoeniKZ
//
//  Created by Kaden Zheng on 1/5/23.
//

import SwiftUI

struct PhoenixPostPopup: View {
    
    @Binding var show: Bool
    @State var link: String
    
    var body: some View {
        
        ZStack {
            
            if show {
                // MARK: - Pop Up background color
                Color.black.opacity(show ? 0.5 : 0).edgesIgnoringSafeArea(.all)
                
                // MARK: - Pop Up Window
                
                ZStack {
                    
                    VStack (alignment: .center) {
                        
                        Text("For the full article, visit:")
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                            .foregroundColor(Color.white)
                        
                        Text(link)
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                            .foregroundColor(Color.white)
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
                .padding(.bottom, 75)
                
            }
        }
    }
}

