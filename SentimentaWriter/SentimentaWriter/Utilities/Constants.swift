//
//  Constants.swift
//  SentimentaWriter
//
//  Created by Samuel Pinheiro Junior on 12/02/19.
//  Copyright © 2019 Samuel Pinheiro Junior. All rights reserved.
//

import Foundation

struct Constants {
    struct GoogleAPI {
        static let apiKey = "AIzaSyBrm8uuFnoPpqau-Q2KN6Yw0ysWv0qKkJk"
        static let baseURL = "https://language.googleapis.com/v1/documents:analyzeSentiment?key=\(apiKey)"
        static let POST = "POST"
    }
    
    struct TwetterAPI {
        static let baseURL = "https://api.twitter.com/1.1/statuses/user_timeline.json"
        static let consumerKey = "WoTzlzgdG2B5SXULPM2xjPnlq"
        static let consumerSecretKey = "CxLTgw6HeK3e6CCOP4OFLYItC5kYvIkCeKZuv0vgriKXGoajRz"
    }
    
    struct UserName{
        static let identifier = "listTwetter"
    }
    
    struct TweetList {
        static let identifier = "emojiViewController"
    }
}
