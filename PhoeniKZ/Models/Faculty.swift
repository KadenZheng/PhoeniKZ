//
//  Events.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/13/22.
//

import Foundation

class Faculty : Identifiable, Decodable {
    
    var id: UUID?
    var name: String
    var position: String
    var email: String
    var image: String
    
}
