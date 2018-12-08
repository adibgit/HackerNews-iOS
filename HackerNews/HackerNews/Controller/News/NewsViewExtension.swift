//
//  NewsViewExtension.swift
//  HackerNews
//
//  Created by ADIB SURANI on 04/12/2018.
//  Copyright © 2018 Adib Surani. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension NewsViewController {
    
    func setupView() {
        setupStatusBar()
        setupBaseView()
        setupTable()
        
        parentView.bringSubviewToFront(loadingView)
    }
    
    fileprivate func setupStatusBar() {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = ColorHEX.lightPurpleColor()
        }
    }
    
    fileprivate func setupBaseView() {
        parentView.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func setupTable() {
        containerView.addSubview(tableView)
        tableView.snp.makeConstraints{ (make) in
            make.edges.equalTo(parentView)
        }
    }
    
    func showLoading(show: Bool) {
        if (show) {
            loadingView.isHidden = true
        } else {
            loadingView.isHidden = false
        }
    }
    
}
