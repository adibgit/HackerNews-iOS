//
//  NewsViewCell.swift
//  HackerNews
//
//  Created by ADIB SURANI on 07/12/2018.
//  Copyright © 2018 Adib Surani. All rights reserved.
//

import UIKit

class NewsViewCell: UITableViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        parentView.bringSubviewToFront(baseView)
        baseView.layer.cornerRadius = 8
        scoreView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(news: News) {
        self.selectionStyle = .none
        
        let date = Date(timeIntervalSince1970: ((news.time!) / 1000.0))
        timeLabel.text = TimeUtil.timeAgoSince(date)
        headlineLabel.text = news.title
        sourceLabel.text = news.author
        scoreLabel.text = String(news.score!)
    }

}
