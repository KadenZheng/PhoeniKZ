//
//  NavigationBar.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/10/22.
//

import SwiftUI

struct NavigationBar: View {
    
    @State var text: String
    
    var body: some View {
        
        ZStack {
            
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .scaleEffect(1.3)
                .opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            
            Text(text)
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
        }
            .frame(height: 70)
            .frame(maxHeight: .infinity, alignment: .top)
        
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(text: "University High")
    }
}
