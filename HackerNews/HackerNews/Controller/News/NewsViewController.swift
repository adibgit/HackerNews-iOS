//
//  ViewController.swift
//  HackerNews
//
//  Created by ADIB SURANI on 04/12/2018.
//  Copyright © 2018 Adib Surani. All rights reserved.
//

import UIKit

class NewsViewController:
    UIViewController,
    OnGetNews,
    OnGetTopStoriesID {
    
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var topView: UIView!
    

    var newsViewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        newsViewModel.getTopStoriesID(onGetTopStoriesID: self)
    }
    
    func onGetTopStoriesIDSuccess(storiesID: [Int]) {
        print(storiesID)
        var count = 0
        for storyID in storiesID {
            if count < 26 {
                count += 1
                newsViewModel.getNews(onGetNews: self,
                                      storyID: String(storyID))
            
            }
        }
    }
    
    func onGetTopStoriesIDFail(error: String) {
        print(error)
    }
    
    func onGetNewsSuccess(news: News) {
        print(String(describing: news))
    }
    
    func onGetNewsFail(error: String) {
        print(error)
    }


}

