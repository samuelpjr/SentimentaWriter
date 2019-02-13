//
//  EmojiViewModel.swift
//  SentimentaWriter
//
//  Created by Samuel Pinheiro Junior on 12/02/19.
//  Copyright © 2019 Samuel Pinheiro Junior. All rights reserved.
//

import Foundation
import UIKit

protocol emojiViewModelDelegate: class {
    func populateAnaliseResultWith(color: UIColor, and emoji: String)
}

class EmojiViewModel {
   private var googleModel: Google?
   private let googleService = GoogleService()
    weak var delegate: emojiViewModelDelegate?
    
    func fetchTGoogle(text: String, completion: @escaping () -> () )  {
        googleService.createGoogleRequestWith(text: text) { [weak self] (googleApi) in
            self?.googleModel = googleApi
            completion()
        }
    }
    
    func getScore() {
        guard let score = googleModel?.documentSentiment.score else {fatalError("score empty")}
        switch score {
        case score where score < -0.25:
            delegate?.populateAnaliseResultWith(color: UIColor.blue, and: "😔")
        case score where score > 0.25:
            delegate?.populateAnaliseResultWith(color: UIColor.yellow, and: "😃")
        default:
            delegate?.populateAnaliseResultWith(color: UIColor.gray, and: "😐")
        }
    }
}
