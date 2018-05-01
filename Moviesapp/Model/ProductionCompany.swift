//
//  ProductionCompany.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/30/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductionCompany: Mappable{
    
    var id: Int!
    var logoPath: String?
    var name: String?
    var originCountry: String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        
        id            <- map["id"]
        logoPath          <- map["logo_path"]
        name            <- map["name"]
        originCountry          <- map["origin_country"]
    }
    
}
