//
//  DetailViewController.swift
//  HackerNews
//
//  Created by ADIB SURANI on 07/12/2018.
//  Copyright © 2018 Adib Surani. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var articleView: UIView!
    @IBOutlet weak var commentListView: UIView!
    @IBOutlet weak var bottomBar: UIView!
    @IBOutlet weak var articleTab: UIView!
    @IBOutlet weak var articleTabImage: UIImageView!
    @IBOutlet weak var commentTab: UIView!
    @IBOutlet weak var commentTabImage: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    
    var webView: WKWebView!
    var news: News!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        headlineLabel.text = news.title
        
        let weburl = URL(string: news.url!)
        let webRequest = URLRequest(url: weburl!)
        webView.load(webRequest)
    }
    
    @objc func articleTapped(sender : UITapGestureRecognizer) {
        bottomBarTapped(tab: Constants.ARTICLE)
    }
    
    @objc func commentTapped(sender : UITapGestureRecognizer) {
        bottomBarTapped(tab: Constants.COMMENT)
    }
    
    @IBAction func dismissTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
