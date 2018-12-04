//
//  NewsViewExtension.swift
//  HackerNews
//
//  Created by ADIB SURANI on 04/12/2018.
//  Copyright © 2018 Adib Surani. All rights reserved.
//

import Foundation
import UIKit

extension NewsViewController {
    
    func setupView() {
        setupStatusBar()
    }
    
    fileprivate func setupStatusBar() {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = ColorHEX.lightPurpleColor()
        }
    }
    
    
    
    
}
