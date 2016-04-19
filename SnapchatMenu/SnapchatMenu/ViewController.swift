//
//  ViewController.swift
//  SnapchatMenu
//
//  Created by Echo on 16/4/19.
//  Copyright © 2016年 LiuXuanyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.sharedApplication().statusBarHidden = true
    
        configrationScrollView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configrationScrollView() {
        let leftView: LeftView = LeftView(nibName: "LeftView", bundle: nil)
        let centerView: CameraView = CameraView(nibName: "CameraView", bundle: nil)
        let rightView: RightView = RightView(nibName: "RightView", bundle: nil)
        
        self.addChildViewController(leftView)
        self.scrollView.addSubview(leftView.view)
        leftView.didMoveToParentViewController(self)
        
        self.addChildViewController(centerView)
        self.scrollView.addSubview(centerView.view)
        centerView.didMoveToParentViewController(self)
        
        self.addChildViewController(rightView)
        self.scrollView.addSubview(rightView.view)
        rightView.didMoveToParentViewController(self)
        
        var centerViewFrame: CGRect = centerView.view.frame
        centerViewFrame.origin.x = self.view.frame.width
        centerView.view.frame = centerViewFrame
        
        var rightViewFrame: CGRect = rightView.view.frame
        rightViewFrame.origin.x = self.view.frame.width * 2
        rightView.view.frame = rightViewFrame
        
        scrollView.contentSize = CGSizeMake(self.view.frame.width * 3, self.view.frame.height)
    }

}

