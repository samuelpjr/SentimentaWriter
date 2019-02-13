//
//  GoogleModel.swift
//  SentimentaWriter
//
//  Created by Samuel Pinheiro Junior on 10/02/19.
//  Copyright © 2019 Samuel Pinheiro Junior. All rights reserved.
//

import Foundation
import UIKit

typealias Google = GoogleElement

struct GoogleElement: Codable {
    let documentSentiment: Sentiment
}

struct Sentiment: Codable {
    let magnitude, score: Double
}
