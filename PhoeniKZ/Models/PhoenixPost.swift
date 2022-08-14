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
    var image: String
    var title: String
    var author: String
    var publishingDate: String
    
}
