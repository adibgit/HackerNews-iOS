//
//  NewsViewExtension.swift
//  HackerNews
//
//  Created by ADIB SURANI on 07/12/2018.
//  Copyright © 2018 Adib Surani. All rights reserved.
//

import Foundation
import UIKit
import WebKit

extension DetailViewController {
    
    func setupView() {
        setupStatusBar()
        setupWebView()
        setupGesture()
        bottomBarTapped(tab: Constants.ARTICLE)
    }
    
    fileprivate func setupStatusBar() {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = ColorHEX.lightPurpleColor()
        }
    }
    
    fileprivate func setupWebView() {
        webView = WKWebView(frame: articleView.bounds, configuration: WKWebViewConfiguration())
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.allowsBackForwardNavigationGestures = true
        articleView.addSubview(webView)
    }
    
    fileprivate func setupGesture() {
        let articleTap = UITapGestureRecognizer(target: self, action:  #selector(self.articleTapped))
        let commentTap = UITapGestureRecognizer(target: self, action:  #selector(self.commentTapped))
        articleTab.addGestureRecognizer(articleTap)
        commentTab.addGestureRecognizer(commentTap)
    }
    
    func bottomBarTapped(tab: Int) {
        
        switch tab {
        case Constants.ARTICLE:
            articleTab.backgroundColor = ColorHEX.lightPurpleColor()
            articleTabImage.image = articleTabImage.image!.withRenderingMode(.alwaysTemplate)
            articleTabImage.tintColor = ColorHEX.whiteColor()
            
            commentTab.backgroundColor = ColorHEX.whiteColor()
            commentTabImage.image = commentTabImage.image!.withRenderingMode(.alwaysTemplate)
            commentTabImage.tintColor = ColorHEX.lightPurpleColor()
            
            articleView.isHidden = false
            commentListView.isHidden = true
        case Constants.COMMENT:
            articleTab.backgroundColor = ColorHEX.whiteColor()
            articleTabImage.image = articleTabImage.image!.withRenderingMode(.alwaysTemplate)
            articleTabImage.tintColor = ColorHEX.lightPurpleColor()
            
            commentTab.backgroundColor = ColorHEX.lightPurpleColor()
            commentTabImage.image = commentTabImage.image!.withRenderingMode(.alwaysTemplate)
            commentTabImage.tintColor = ColorHEX.whiteColor()
            
            articleView.isHidden = true
            commentListView.isHidden = false
        default:
            print("No availble tab")
        }
    }
    
    
    
    
}
