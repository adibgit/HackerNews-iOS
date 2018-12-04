//
//  RestAPI.swift
//  HackerNews
//
//  Created by ADIB SURANI on 04/12/2018.
//  Copyright © 2018 Adib Surani. All rights reserved.
//

import Foundation
import Alamofire

let BASE_URL = "https://hacker-news.firebaseio.com/v0/"

struct RestAPI {
    
    static func getTopStoriesID() -> URL {
        return URL(string: "\(BASE_URL)topstories.json?print=pretty")!
    }
    
    static func getStory(storyID: String) -> URL {
        return URL(string: "\(BASE_URL)item/\(storyID).json?print=pretty")!
    }
    
    static func getComment(commentID: String) -> URL {
        return URL(string: "\(BASE_URL)item/\(commentID).json?print=pretty")!
    }
    
}

