//
//  SpokenLanguage.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/30/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import Foundation
import ObjectMapper

class SpokenLanguage: Mappable{
    
    var iso639_1: Int!
    var name: String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        
        iso639_1            <- map["iso_639_1"]
        name            <- map["name"]
    }
    
}
