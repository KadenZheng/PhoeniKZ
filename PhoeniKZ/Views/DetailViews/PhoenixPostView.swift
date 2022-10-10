//
//  PhoenixPostView.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/13/22.
//

import SwiftUI

struct PhoenixPostView: View {
    
    @State var content: String
    @State var image: String
    @State var title: String
    @State var author: String
    @State var publishingDate: String
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .foregroundColor(.gray)
            
            ScrollView {
                
                VStack (alignment: .center) {
                    
                    // MARK: - Title
                    
                    ZStack (alignment: .center) {
                        
                        Image(image)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: 325)
                            .scaledToFill()
                            .blur(radius: 1)
                            .clipped()
                        
                        VStack (spacing: 20) {
                            
                            ZStack (alignment: .center) {
                                Text(title)
                                    .font(.title3.weight(.semibold))
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                                    .multilineTextAlignment(.center)
                                    .frame(width: UIScreen.main.bounds.width - 65)
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .border(.white, width: 8)
                                    .frame(width: UIScreen.main.bounds.width - 40, height: 100)
                                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                            }
                            
                            
                            Text("\(author),  \(publishingDate)")
                                .font(.headline.weight(.medium))
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                        }.padding(.top, 100)
                        
                    }
                    .edgesIgnoringSafeArea(.top)
                    .padding(.bottom, 50)
                    
                    Text(content)
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width - 50, alignment: .topLeading)
                        .padding(.bottom, 100)
                    
                    
                }
            }
            .edgesIgnoringSafeArea(.top)
            
        }
    }
}

struct PhoenixPostView_Previews: PreviewProvider {
    static var previews: some View {
        PhoenixPostView(content: """
                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean et est a dui semper facilisis. Pellentesque placerat elit a nunc.
                        Nullam tortor odio, rutrum quis, egestas ut, posuere sed, felis. Vestibulum placerat feugiat nisl.
                        Suspendisse lacinia, odio non feugiat vestibulum, sem erat blandit metus, ac nonummy magna odio pharetra felis. Vivamus vehicula velit non metus faucibus auctor. Nam sed augue. Donec orci. Cras eget diam et dolor dapibus sollicitudin. In lacinia, tellus vitae laoreet ultrices, lectus ligula dictum dui, eget condimentum velit dui vitae ante. Nulla nonummy augue nec pede. Pellentesque ut nulla. Donec at libero. Pellentesque at nisl ac nisi fermentum viverra. Praesent odio. Phasellus tincidunt diam ut ipsum. Donec eget est.
                        """, image: "red_flowers", title: "National Black Doll Museum Works to Recover from COVID-19 Closure", author: "Kaden Zheng", publishingDate: "08/13/2022")
    }
}
