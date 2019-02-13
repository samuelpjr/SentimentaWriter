//
//  TwitterModel.swift
//  SentimentaWriter
//
//  Created by Samuel Pinheiro Junior on 10/02/19.
//  Copyright © 2019 Samuel Pinheiro Junior. All rights reserved.
//

import Foundation
import UIKit

typealias Twitter = [TwitterModel]

struct TwitterModel: Codable {
    let text: String
    let createdAt: String
    let user: User
    let lang: String
    
    enum CodingKeys: String, CodingKey {
        case text
        case createdAt = "created_at"
        case user
        case lang
    }
}

struct User: Codable {
    let name, screenName: String
    let lang: String
    let profileImageURL: String
    let profileImageURLHTTPS: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case screenName = "screen_name"
        case lang
        case profileImageURL = "profile_image_url"
        case profileImageURLHTTPS = "profile_image_url_https"
    }
}
