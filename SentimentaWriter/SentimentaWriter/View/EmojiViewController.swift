//
//  EmojiViewController.swift
//  SentimentaWriter
//
//  Created by Samuel Pinheiro Junior on 11/02/19.
//  Copyright © 2019 Samuel Pinheiro Junior. All rights reserved.
//

import Foundation
import UIKit

class EmojiViewController: UIViewController, emojiViewModelDelegate {
    
    var tweeterText = String()
    private var emojiViewModel = EmojiViewModel()
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var bgColorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojiViewModel.delegate = self
        fetchGoogle()
        setupComponents()
    }
    
    fileprivate func fetchGoogle() {
        emojiViewModel.fetchTGoogle(text: tweeterText) { [weak self] in
            self?.emojiViewModel.getScore()
        }
    }
    
    func populateAnaliseResultWith(color: UIColor, and emoji: String) {
        DispatchQueue.main.async {
            self.emojiLabel.text = emoji
            self.bgColorView.backgroundColor = color
        }
        
    }
    
    func setupComponents() {
        bgColorView.layer.cornerRadius = 100
        bgColorView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        bgColorView.layer.masksToBounds = true
    }
    
}

