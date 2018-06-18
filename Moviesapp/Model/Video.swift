//
//  Video.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/30/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import Foundation
import ObjectMapper

struct Video: Mappable{
    
    var id: String = ""
    var iso639_1: String?
    var iso3166_1: String?
    var name: String?
    var key: String?
    var site: String?
    var size: Int?
    var type: String?
    
    
    init?(map: Map) {
        
    }
    
    // Mappable
    mutating func mapping(map: Map) {
        
        id            <- map["id"]
        iso639_1          <- map["iso_639_1"]
        iso3166_1            <- map["iso_3166_1"]
        name          <- map["name"]
        key            <- map["key"]
        site          <- map["site"]
        size          <- map["size"]
        type          <- map["type"]
    }
    
    
    func videoUrl() -> URL?{
        
        guard let site = site else { return nil }
        
        switch site {
            
        case "YouTube":
            guard let key = key else { return nil }
            return URL(string: "https://www.youtube.com/embed/\(key)?playsinline=1")
            
        default:
            return nil
        }
        
        
    }
    
}
