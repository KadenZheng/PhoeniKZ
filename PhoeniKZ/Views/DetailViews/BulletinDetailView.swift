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
                        .cornerRadius(25, corners: [.topLeft, .bottomRight])
                        .foregroundColor(.gray)
                    
                    VStack {
                        
                        Text("Bulletin")
                            .font(.title2.weight(.medium))
                        Text(formatDate())
                            .font(.headline.weight(.thin))
                        
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
    }
}
