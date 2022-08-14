//
//  PhoenixPostView.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/13/22.
//

import SwiftUI

struct PhoenixPostView: View {
    var body: some View {
            
            VStack (alignment: .center) {
                
                ZStack (alignment: .center) {
                    
                    Text("Title of Post")
                    
                    Rectangle()
                        .border(.black, width: 5)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 100)
                    
                }
                
            }
        }
}

struct PhoenixPostView_Previews: PreviewProvider {
    static var previews: some View {
        PhoenixPostView()
    }
}
