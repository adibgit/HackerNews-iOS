//
//  News.swift
//  HackerNews
//
//  Created by ADIB SURANI on 04/12/2018.
//  Copyright © 2018 Adib Surani. All rights reserved.
//

import Foundation
import ObjectMapper

class News: Mappable {
    
    var author      : String?
    var descendants : String?
    var id          : String?
    var kids        : [Int]?
    var score       : Int?
    var time        : Double?
    var title       : String?
    var type        : String?
    var url         : String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
    
        author      <- map["by"]
        descendants <- map["descendants"]
        id          <- map["id"]
        kids        <- map["kids"]
        score       <- map["score"]
        time        <- map["time"]
        title       <- map["title"]
        type        <- map["type"]
        url         <- map["url"]
    }
}
