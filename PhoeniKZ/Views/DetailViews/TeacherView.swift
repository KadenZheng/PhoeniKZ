//
//  TeacherView.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/10/22.
//

import SwiftUI

struct TeacherView: View {
    
    @EnvironmentObject var model: Manager
    
    var body: some View {
        
        LazyVStack {
            
            ScrollView {
                
                ForEach(model.faculty) { r in
                    
                    FacultyCard(image: "mosaic_phoenix-black", name: r.name, position: r.position)
                    
                }
            }
        }
    }
}

struct TeacherView_Previews: PreviewProvider {
    static var previews: some View {
        TeacherView()
            .environmentObject(Manager())
    }
}
