//
//  HomeViewPopup.swift
//  PhoeniKZ
//
//  Created by Kaden Zheng on 1/2/23.
//

import SwiftUI

struct ActivitiesViewPopup: View {
    
    @Binding var show: Bool
    var body: some View {
        
        ZStack {
            
            if show {
                // MARK: - Pop Up background color
                Color.black.opacity(show ? 0.5 : 0).edgesIgnoringSafeArea(.all)
                
                // MARK: - Pop Up Window
                
                ZStack {
                    
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
                    
                    VStack (alignment: .center) {
                        
                        Text("To feature your photo, please send it to")
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                            .foregroundColor(Color.white)
                        
                        Text("KadenZheng@mail.fresnostate.edu")
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                            .foregroundColor(Color.white)
                        
                        Text("Thanks!")
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                            .foregroundColor(Color.white)
                    }
                    .padding()
                    .frame(maxWidth: 300)
                    .background(.thinMaterial)
                    .cornerRadius(25)

                }
                .padding(.bottom, 75)
                
            }
        }
    }
}
