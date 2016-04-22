//
//  ViewController.swift
//  RandomColorGradient
//
//  Created by Echo on 16/4/22.
//  Copyright © 2016年 LiuXuanyi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()
    
    let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UIApplication.sharedApplication().statusBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playMusicButtonPress(sender:AnyObject) {
        let music = NSURL.init(fileURLWithPath: NSBundle.mainBundle().pathForResource("Ecstasy", ofType: "mp3")!)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer.init(contentsOfURL: music)
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        catch let audioError as NSError {
            print(audioError)
        }
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(ViewController.randomColor), userInfo: nil, repeats: true)
        
        let redV = CGFloat(drand48())
        let greenV = CGFloat(drand48())
        let blueV = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor.init(red: redV, green: greenV, blue: blueV, alpha: 1)
        
        gradientLayer.frame = view.bounds
        
        let color1 = UIColor(white: 0.5, alpha: 0.2).CGColor as CGColorRef
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).CGColor as CGColorRef
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).CGColor as CGColorRef
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).CGColor as CGColorRef
        let color5 = UIColor(white: 0.4, alpha: 0.2).CGColor as CGColorRef
        
        gradientLayer.colors = [color1,color2, color3,color4,color5]
        gradientLayer.locations = [0.1,0.3,0.5,0.7,0.9]
        gradientLayer.startPoint = CGPointMake(0, 0)
        gradientLayer.endPoint = CGPointMake(1, 1)
        self.view.layer.addSublayer(gradientLayer)
    }
    
    func randomColor() {
        let redV = CGFloat(drand48())
        let greenV = CGFloat(drand48())
        let blueV = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor.init(red: redV, green: greenV, blue: blueV, alpha: 1)
    }
}

