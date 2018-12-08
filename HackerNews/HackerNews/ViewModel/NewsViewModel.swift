//
//  NewsViewModel.swift
//  HackerNews
//
//  Created by ADIB SURANI on 04/12/2018.
//  Copyright © 2018 Adib Surani. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

protocol OnGetTopStoriesID {
    func onGetTopStoriesIDSuccess(storiesID: [Int])
    func onGetTopStoriesIDFail(error: String)
}

protocol OnGetNews {
    func onGetNewsSuccess(news: News)
    func onGetNewsFail(error: String)
}

class NewsViewModel {
    
    func getTopStoriesID(onGetTopStoriesID: OnGetTopStoriesID) {
        Alamofire
            .request(RestAPI.getTopStoriesID(),
                     method: .get,
                     encoding: JSONEncoding.default,
                     headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success:
                    onGetTopStoriesID.onGetTopStoriesIDSuccess(storiesID: response.result.value as! [Int])
                case .failure:
                    onGetTopStoriesID.onGetTopStoriesIDFail(error: response.result.description)
                }
        }
    }
    
    func getNews(onGetNews: OnGetNews,
                 storyID: String) {
        Alamofire
            .request(RestAPI.getStory(storyID: storyID),
                     method: .get,
                     encoding: JSONEncoding.default,
                     headers: nil)
            .responseObject { (response: DataResponse<News>) in
                switch response.result {
                case .success:
                    onGetNews.onGetNewsSuccess(news: response.result.value!)
                case .failure:
                    onGetNews.onGetNewsFail(error: response.result.description)
                }
        }
    }
    
    
    
}
