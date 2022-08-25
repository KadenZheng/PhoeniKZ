//
//  BulletinDetailView.swift
//  PhoeniKZ
//
//  Created by Kaden Zheng on 8/22/22.
//

import SwiftUI

struct BulletinDetailView: View {
    
    @EnvironmentObject var model: Manager
    
    var body: some View {
        
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
                .padding(.bottom, 10)
                .padding(.top, 10)
                
                ForEach(model.bulletinData) { bulletin in
                    
                    NavigationLink {
                        BulletinDetailDetailView(title: bulletin.title, description: bulletin.description)
                    } label: {
                        
                        VStack {
                            
                            HStack {
                                
                                VStack (alignment: .leading) {
                                    
                                    
                                    Text(bulletin.title)
                                        .font(.headline.weight(.medium))
                                        .foregroundColor(.black)
                                    
                                    Text(bulletin.description)
                                        .font(.subheadline.weight(.light))
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(.black)
                                        .lineLimit(2)
                                    
                                }
                                
                                Spacer()
                                
                                Image(systemName: "arrow.right")
                                    .padding(.trailing)
                                    .foregroundColor(.gray)
                                
                            }
                            .frame(width: UIScreen.main.bounds.width - 30, alignment: .leading)
                            
                            
                            Divider()
                                .frame(width: UIScreen.main.bounds.width, alignment: .center)
                            
                        }
                    }
                    
                }
                
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

struct BulletinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BulletinDetailView()
            .environmentObject(Manager())
    }
}