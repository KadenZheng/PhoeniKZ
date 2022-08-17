//
//  Category.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/14/22.
//

import Foundation

class Category : Identifiable, Decodable {
    
    var id: UUID?
    var name: String
    var isSelected: Bool
}
