//
//  BulletinDetailView.swift
//  PhoeniKZ
//
//  Created by Kaden Zheng on 8/22/22.
//

import SwiftUI

struct BulletinDetailView: View {
    
    @EnvironmentObject var model: Manager
    @State var selectedCategory: String
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .foregroundColor(.black)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                
                LazyVStack {
                    
                    ZStack {
                        
                        Rectangle()
                            .frame(height: 100)
                            .cornerRadius(25, corners: [.topLeft, .topRight])
                            .foregroundColor(.gray)
                        
                        VStack (spacing: 10) {
                            
                            Text("Bulletin")
                                .font(.title2.weight(.medium))
                            Text(formatDate())
                                .font(.headline.weight(.thin))
                            
                        }
                        
                    }
                    .padding(.top, -30)
                    .padding(.bottom, 10)
                    
                    ForEach(model.bulletinData) { bulletin in
                        
                        if bulletin.category == selectedCategory {
                            
                            NavigationLink {
                                BulletinDetailDetailView(title: bulletin.title, description: bulletin.description)
                            } label: {
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        VStack (alignment: .leading) {
                                            
                                            
                                            Text(bulletin.title)
                                                .font(.headline.weight(.medium))
                                                .foregroundColor(.white)
                                                .multilineTextAlignment(.leading)
                                            
                                            Text(bulletin.description)
                                                .font(.subheadline.weight(.light))
                                                .multilineTextAlignment(.leading)
                                                .foregroundColor(.white)
                                                .lineLimit(2)
                                            
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "arrow.right")
                                            .padding(.trailing)
                                            .foregroundColor(.white)
                                        
                                    }
                                    .frame(width: UIScreen.main.bounds.width - 30, alignment: .leading)
                                    
                                    
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width, alignment: .center)
                                        .overlay(.white)
                                    
                                }
                            }
                        }
                        
                    }
                    
                }
                .padding(.top, 130)
            }
            
        }
        
        
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
