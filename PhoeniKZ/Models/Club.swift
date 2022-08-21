//
//  Club.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/19/22.
//

import Foundation

class Club : Identifiable, Decodable {
    
    var id: UUID?
    var name: String
    var image: String
    var advisor: String
    var meetingDate: String
    
}
