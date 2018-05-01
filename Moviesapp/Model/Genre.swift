//
//  Genre.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/30/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import Foundation
import ObjectMapper

class Genre: Mappable{
    
    var id: Int!
    var name: String = ""
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        
        id            <- map["id"]
        name          <- map["name"]
    }
    
}
