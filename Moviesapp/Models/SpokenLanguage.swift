//
//  SpokenLanguage.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/30/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import Foundation
import ObjectMapper

struct SpokenLanguage: Mappable{
    
    var iso639_1: Int!
    var name: String?
    
    init?(map: Map) {
        
    }
    
    // Mappable
    mutating func mapping(map: Map) {
        
        iso639_1            <- map["iso_639_1"]
        name            <- map["name"]
    }
}


protocol SpokenLanguageProtocol {
    
    var iso639_1: Int {get set}
    var name: String? {get set}
}
