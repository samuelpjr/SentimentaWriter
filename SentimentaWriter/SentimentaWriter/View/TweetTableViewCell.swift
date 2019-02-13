//
//  TweetTableViewCell.swift
//  SentimentaWriter
//
//  Created by Samuel Pinheiro Junior on 10/02/19.
//  Copyright © 2019 Samuel Pinheiro Junior. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var thumbImageProfile: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nameScreenLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var TweetTextLabel: UILabel!
    
    var tweet: TwitterModel? {
        didSet {
            setTweet()
        }
    }
    
    private func setTweet() {
        setupComponents()
        guard let model = tweet else {return}
        dateLabel.text = model.createdAt
        nameLabel.text = model.user.name
        nameScreenLabel.text = model.user.screenName
        TweetTextLabel.text = model.text
        thumbImageProfile.image = urlImage()
    }
    
    private func urlImage() -> UIImage {
        guard let urlImege = tweet?.user.profileImageURLHTTPS,
            let url = URL(string:urlImege),
            let data = try? Data(contentsOf: url),
            let image = UIImage(data: data) else { fatalError() }
        return image
    }
    
    func setupComponents() {
        thumbImageProfile.layer.cornerRadius = 24
        thumbImageProfile.layer.masksToBounds = true
    }
}
