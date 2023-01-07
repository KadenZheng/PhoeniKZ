//
//  PhoenixPost.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/13/22.
//

import Foundation

class PhoenixPost: Identifiable, Decodable {
    
    var id: UUID?
    var content: String
    var imageURL: String
    var title: String
    var author: String
    var publishingDate: String
    var fullLink: String
    
}
