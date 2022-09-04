//
//  Faculty.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/10/22.
//

import Foundation

class Event : Identifiable, Decodable {
    
    var id: UUID?
    var title: String
    var caption: String
    var image: String
    var location: String
    var time: String
    var contact: String
    var imageURL: String
    var description: String
    
}

