//
//  LetterPostViewController.swift
//  OSU!!
//
//  Created by 直井翔汰 on 2018/04/28.
//  Copyright © 2018年 直井翔汰. All rights reserved.
//

import UIKit

class LetterPostViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var titleTextField: UITextField! {
        didSet {
            titleTextField.delegate = self
        }
    }
    
    @IBOutlet weak var destinationTextField: UITextField! {
        didSet {
            destinationTextField.delegate = self
        }
    }
    
    @IBOutlet weak var bodyTextView: PlaceHolderTextView! {
        didSet {
            bodyTextView.delegate = self
        }
    }
    @IBOutlet weak var bodyTextViewBottomConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var sendButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButton.isEnabled = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)) , name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @IBAction func sendButtonAction(_ sender: UIBarButtonItem) {
        //TODO: APIつなぎこみの時に書こうね
//        .request() { result
//            switch reuslt {
//            case .success(let response):
//                if response.negaposi {
//                    //TODO: HUD yes
//                } else {
//                    //TODO: HUD no
//                }
//            case .error:
//                let alert = UIAlertController(title: "エラーが発生しました。", message: "なんらかのエラーが発生しました。", preferredStyle: .default)
//                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//
//            }
//        }
        
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Any] else {
            return
        }
        guard let keyboardInfo = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        guard let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        let keyboardHeight = keyboardInfo.cgRectValue.size.height
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            self.bodyTextViewBottomConstraints.constant += keyboardHeight
            self.view.layoutIfNeeded()
        })
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Any] else {
            return
        }
        guard let keyboardInfo = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        guard let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        let keyboardHeight = keyboardInfo.cgRectValue.size.height
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            self.bodyTextViewBottomConstraints.constant -= keyboardHeight
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func dismissButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

