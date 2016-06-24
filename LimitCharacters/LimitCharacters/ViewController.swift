//
//  ViewController.swift
//  LimitCharacters
//
//  Created by Xuanyi Liu on 16/6/24.
//  Copyright © 2016年 Xuanyi Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var bottomUIView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var characterCountLabel: UILabel!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        avatarImageView.layer.cornerRadius = 25
        avatarImageView.layer.masksToBounds = true
        
        tweetTextView.delegate = self
        tweetTextView.backgroundColor = UIColor.clear()
        
        NotificationCenter.default().addObserver(self, selector: #selector(keyBoardWillShow(noti:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default().addObserver(self, selector: #selector(keyBoardWillHide(noti:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let myTextViewString = tweetTextView.text
        characterCountLabel.text = "\(140 - (myTextViewString?.characters.count)!)"
        if range.length > 140 {
            return false
        }
        
        let newLength = (myTextViewString?.characters.count)! + range.length
        
        return newLength < 140
    }

    func keyBoardWillShow(noti: NSNotification) {
        let userInfo = noti.userInfo
        let keyboardBounds = (userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue()
        let duration = (userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let deltaY = keyboardBounds.size.height
        let animations:(() -> Void) = {
            self.bottomUIView.transform = CGAffineTransform(translationX: 0, y: -deltaY)
        }
        
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: animations, completion: nil)
        }
        else {
            animations()
        }
    }
    
    func keyBoardWillHide(noti: NSNotification) {
        let userInfo = noti.userInfo
        let duration = (userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let animations:(() -> Void) = {
            self.bottomUIView.transform = CGAffineTransform.init(a: 1, b:0, c:0, d: 1, tx: 0, ty: 0)
        }
        
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: animations, completion: nil)
        }
        else {
            animations()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

