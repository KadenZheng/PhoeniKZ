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
        
        ScrollView {
            
            VStack {
                
                ZStack (alignment: .bottom) {
                    
                    Rectangle()
                        .frame(height: 150)
                    
                    Text(title)
                        .font(.title.weight(.medium))
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                }
                .frame(maxHeight: UIScreen.main.bounds.height, alignment: .top)
                
                Text(formatDate())
                    .font(.body.weight(.light))
                    .padding()
                
                Divider()
                
                Text(description)
                    .lineSpacing(4)
                    .multilineTextAlignment(.leading)
                    .padding()
                
            }
            
            
        }
        .edgesIgnoringSafeArea(.top)
        
    }
    
}

struct BulletinDetailDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BulletinDetailDetailView(title: "Text", description: "DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription")
    }
}
