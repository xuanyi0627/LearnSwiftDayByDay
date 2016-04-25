//
//  ViewController.swift
//  SpotifyVideoBackground
//
//  Created by Echo on 16/4/25.
//  Copyright © 2016年 LiuXuanyi. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setBackGroundVideo()
        self.loginButton.layer.cornerRadius = 4
        self.signupButton.layer.cornerRadius = 4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setBackGroundVideo() {
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("moments", ofType: ".mp4")!)
        
        videoFrame = view.bounds
        fillMode = .ResizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url
        view.userInteractionEnabled = false
    }

}

