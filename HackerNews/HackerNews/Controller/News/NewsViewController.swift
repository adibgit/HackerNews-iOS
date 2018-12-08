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
    @IBOutlet weak var loadingView: UIView!
    
    lazy var tableView: UITableView = {
        let tableNews = UITableView()
        tableNews.dataSource = self
        tableNews.delegate = self
        tableNews.backgroundColor = UIColor.clear
        tableNews.register(UINib(nibName: "NewsViewCell", bundle: nil), forCellReuseIdentifier: "NewsViewCell")
        tableNews.separatorStyle = .none
        tableNews.rowHeight = UITableView.automaticDimension
        return tableNews
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorHEX.whiteColor()
        return view
    }()

    var newsViewModel = NewsViewModel()
    var newsList = Array<News>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        showLoading(show: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        newsViewModel.getTopStoriesID(onGetTopStoriesID: self)
    }
    
    func onGetTopStoriesIDSuccess(storiesID: [Int]) {
        print(storiesID)
        var count = 0
        for storyID in storiesID {
            if count < 26 {
                count += 1
                newsViewModel.getNews(onGetNews: self,storyID: String(storyID))
            }
        }
    }
    
    func onGetTopStoriesIDFail(error: String) {
        print(error)
    }
    
    func onGetNewsSuccess(news: News) {
        newsList.append(news)
        showLoading(show: true)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func onGetNewsFail(error: String) {
        print(error)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewsToDetail" ,
            let nextScene = segue.destination as? DetailViewController ,
            let indexPath = self.tableView.indexPathForSelectedRow {
            let selectedNews = newsList[indexPath.row]
            nextScene.news = selectedNews
        }
    }

}

