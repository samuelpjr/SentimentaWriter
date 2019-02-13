//
//  TweetListViewModel.swift
//  SentimentaWriter
//
//  Created by Samuel Pinheiro Junior on 12/02/19.
//  Copyright © 2019 Samuel Pinheiro Junior. All rights reserved.
//

import Foundation
import UIKit

class TweetListViewModel {
    private var tweets = [TwitterModel]()
    private var twitterService = TwitterService()
    
    func numberOfRows() -> Int {
        return tweets.count
    }
    
    func cellForRowAt(indexPath: IndexPath, tableView: UITableView ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetTableViewCell
        cell.tweet = tweets[indexPath.row]
        return cell
        
    }
    
    func didSelectRowAt(index: Int) -> String {
        return tweets[index].text
    }
    
    func fetchTweet(userName: String, completion: @escaping () -> () )  {
        twitterService.fetchTwitterWith(name: userName) { [weak self] (tweet) in
            self?.tweets = tweet
            completion()
        }
    }
}
