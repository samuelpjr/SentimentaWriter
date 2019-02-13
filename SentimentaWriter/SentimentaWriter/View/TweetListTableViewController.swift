//
//  TweetListTableViewController.swift
//  SentimentaWriter
//
//  Created by Samuel Pinheiro Junior on 10/02/19.
//  Copyright © 2019 Samuel Pinheiro Junior. All rights reserved.
//

import UIKit

class TweetListTableViewController: UITableViewController {

    @IBOutlet weak var thumbImageUser: UIImageView!
    private var tweetListViewModel = TweetListViewModel()
    var twetterText = String()
    var userName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        featchTweets()
    }
    
    fileprivate func featchTweets() {
        tweetListViewModel.fetchTweet(userName: userName) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let vc = segue.destination as? EmojiViewController {
            vc.tweeterText = twetterText
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetListViewModel.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tweetListViewModel.cellForRowAt(indexPath: indexPath, tableView: tableView)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        twetterText = tweetListViewModel.didSelectRowAt(index: indexPath.row)
        self.performSegue(withIdentifier: Constants.TweetList.identifier, sender: nil)
        
    }

}
