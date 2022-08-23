//
//  Bulletin.swift
//  PhoeniKZ
//
//  Created by Kaden Zheng on 8/22/22.
//

import Foundation

class Bulletin: Identifiable, Decodable {
    
    var id: UUID?
    var title: String
    var description: String
    
}
