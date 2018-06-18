//
//  ProductionCountry.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/30/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import Foundation
import ObjectMapper

struct ProductionCountry: Mappable{
    
    var iso3166_1: Int!
    var name: String?
    
    init?(map: Map) {
        
    }
    
    // Mappable
    mutating func mapping(map: Map) {
        
        iso3166_1            <- map["iso_3166_1"]
        name            <- map["name"]
    }
    
}
