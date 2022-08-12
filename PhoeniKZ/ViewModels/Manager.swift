//
//  Manager.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/10/22.
//

import Foundation

class Manager : ObservableObject {
    
    @Published var faculty = [Faculty]()
    
    init() {
        self.faculty = DataService.getLocalData()
    }
    
}
