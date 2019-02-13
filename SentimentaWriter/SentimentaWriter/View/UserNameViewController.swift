//
//  ViewController.swift
//  SentimentaWriter
//
//  Created by Samuel Pinheiro Junior on 08/02/19.
//  Copyright © 2019 Samuel Pinheiro Junior. All rights reserved.
//

import UIKit



class UserNameViewController: UIViewController {
    @IBOutlet weak var nameUser: UITextField!
    @IBOutlet weak var searchContainerBottomAnchor: NSLayoutConstraint!
    @IBOutlet weak var bgImge: UIImageView!
    @IBOutlet weak var sendButton: UIButton!
    
    var userName = String()
    private var userNameViewModel = UserNameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameUser.delegate = self
        userNameViewModel.delegate = self
        setupComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardHandler()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        userNameViewModel.removeKeyboardsObserver()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let vc = segue.destination as? TweetListTableViewController {
            vc.userName = userName
        }
    }
    
    @IBAction func sendNametoTwitter(_ sender: Any) {
        if let name = nameUser.text {
            userName = name
        }
        self.performSegue(withIdentifier: Constants.UserName.identifier, sender: nil)
    }
    
    @objc func returnKeyboard() {
        userNameViewModel.returnKeyboard(textField: nameUser)
    }

    @objc func handleKeyboard(notification: NSNotification) {
        userNameViewModel.hendlerKeyboard(notification: notification, anchor: searchContainerBottomAnchor)
    }
    
    func keyboardHandler() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(returnKeyboard)))
        NotificationCenter.default.addObserver(self, selector:  #selector(handleKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:  #selector(handleKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setupComponents() {
        sendButton.layer.cornerRadius = 15
        sendButton.layer.masksToBounds = true
    }
}

extension UserNameViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameUser.resignFirstResponder()
        return true
    }
}

extension UserNameViewController: UserNameViewModelDelegate {
    var viewController: UIViewController {
        return self
    }
}
