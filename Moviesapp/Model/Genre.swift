//
//  Genre.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/30/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import Foundation
import ObjectMapper

struct Genre: Mappable{
    
    var id: Int!
    var name: String = ""
    
    init?(map: Map) {
        
    }
    
    // Mappable
    mutating func mapping(map: Map) {
        
        id            <- map["id"]
        name          <- map["name"]
    }
    
}
