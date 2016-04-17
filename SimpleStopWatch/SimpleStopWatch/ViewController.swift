//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by Echo on 16/4/17.
//  Copyright © 2016年 LiuXuanyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var Counter = 0.0
    var timer = NSTimer()
    var isPlaying = false
    
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent;
    }

    override func viewDidLoad() {
        timeLabel.text = String(Counter)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if Counter == 0.0 {
            pauseButton.enabled = false;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startButtonPress(sender: AnyObject) {
        if isPlaying == true {
            return
        }
        startButton.enabled = false
        pauseButton.enabled = true
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector:#selector(ViewController.UpdateTimer), userInfo: nil
        , repeats: true)
    }
    
    @IBAction func pauseButtonPress(sender: AnyObject) {
        startButton.enabled = true
        pauseButton.enabled = false
        timer.invalidate()
        isPlaying = false
    }
    
    @IBAction func resetButtonPress(sender: AnyObject) {
        timer.invalidate()
        isPlaying = false
        Counter = 0.0
        timeLabel.text = String(Counter)
        startButton.enabled = true
        pauseButton.enabled = false
    }
    
    func UpdateTimer() {
        Counter += 0.1
        timeLabel.text = String(format: "%.1f", Counter)
        if Counter == 0.0 {
            pauseButton.enabled = false;
        }
        else {
            pauseButton.enabled = true;
        }
    }

}

