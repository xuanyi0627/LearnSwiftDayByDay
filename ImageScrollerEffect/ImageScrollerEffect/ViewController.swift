//
//  ViewController.swift
//  ImageScrollerEffect
//
//  Created by Echo on 16/4/23.
//  Copyright © 2016年 LiuXuanyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var imageView: UIImageView!
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView = UIImageView.init(image: UIImage.init(named: "steve"))
        
        setUpScrollView()
        scrollView.delegate = self
        
        setZoomScaleFor(scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        recenterImage()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setZoomScaleFor(scrollView.bounds.size)
        if scrollView.zoomScale < scrollView.minimumZoomScale {
            scrollView.zoomScale = scrollView.minimumZoomScale
        }
        
        recenterImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUpScrollView() {
        scrollView = UIScrollView.init(frame: view.bounds)
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.contentSize = imageView.bounds.size
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
    }
    
    private func setZoomScaleFor(scrollViewSize: CGSize) {
        
        let imageSize = imageView.bounds.size
        let w = scrollViewSize.width / imageSize.width
        let h = scrollViewSize.height / imageSize.height
        let mini = min(w, h)
        scrollView.minimumZoomScale = mini
        scrollView.maximumZoomScale = 3.0
    }
    
    private func recenterImage() {
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.bounds.size
        let horSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        
        let verSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2.0 : 0
        
        scrollView.contentInset = UIEdgeInsetsMake(verSpace, horSpace, verSpace, horSpace)
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

