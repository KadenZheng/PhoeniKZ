//
//  BulletinDetailDetailVeiw.swift
//  PhoeniKZ
//
//  Created by Kaden Zheng on 8/25/22.
//

import SwiftUI

struct BulletinDetailDetailView: View {
    
    @State var title: String
    @State var description: String
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .foregroundColor(.black)
            
            ScrollView {
                
                VStack {
                    
                    ZStack (alignment: .bottom) {
                        
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(height: 170)
                            .frame(maxHeight: UIScreen.main.bounds.height, alignment: .top)
                        
                        Text(title)
                            .font(.title.weight(.medium))
                            .foregroundColor(.white)
                            .padding(.bottom)
                            .multilineTextAlignment(.center)
                            .padding(.top)
                        
                    }
                    .frame(maxHeight: UIScreen.main.bounds.height, alignment: .top)
                    
                    
                    Text(formatDate())
                        .font(.body.weight(.light))
                        .padding()
                        .foregroundColor(.white)
                    
                    Divider()
                        .overlay(.white)
                        .frame(width: UIScreen.main.bounds.width - 40)
                    
                    Text(description)
                        .lineSpacing(4)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .foregroundColor(.white)
                    
                }
                
                
            }
            .edgesIgnoringSafeArea(.top)
            
        }
        
    }
    
}

struct BulletinDetailDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BulletinDetailDetailView(title: "Text", description: "DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription")
    }
}
