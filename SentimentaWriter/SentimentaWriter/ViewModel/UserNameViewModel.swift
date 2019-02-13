//
//  UserNameViewModel.swift
//  SentimentaWriter
//
//  Created by Samuel Pinheiro Junior on 12/02/19.
//  Copyright © 2019 Samuel Pinheiro Junior. All rights reserved.
//

import Foundation
import UIKit

protocol UserNameViewModelDelegate: class {
    var viewController: UIViewController {get}
}

class UserNameViewModel {
    
    weak var delegate: UserNameViewModelDelegate?
    
    func returnKeyboard(textField: UITextField) {
        textField.resignFirstResponder()
    }

    func removeKeyboardsObserver() {
        guard let vc = delegate?.viewController else { return }
        NotificationCenter.default.removeObserver(vc, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(vc, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func hendlerKeyboard(notification: NSNotification, anchor: NSLayoutConstraint) {
        guard let vc = delegate?.viewController else { return }
        if let userInfo = notification.userInfo{
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let isKeyboardShowing = notification.name == UIResponder.keyboardWillShowNotification
            anchor.constant = isKeyboardShowing ? (keyboardFrame!.height) : 0
            
            UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
                vc.view.layoutIfNeeded()
            }, completion: nil)
        }
        
    }
    
}
