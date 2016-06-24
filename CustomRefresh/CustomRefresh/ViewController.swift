//
//  ViewController.swift
//  CustomRefresh
//
//  Created by Xuanyi Liu on 16/6/24.
//  Copyright © 2016年 Xuanyi Liu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var refreshController: UIRefreshControl!
    var customView: UIView!
    var labelsArray: Array<UILabel> = []
    var isAnimationg = false
    var currentColorIndex = 0
    var currentLabelIndex = 0
    var timer: Timer!
    var dataArray: Array<String> = ["😂", "🤗", "😳", "😌", "😊"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        refreshController = UIRefreshControl()
        refreshController.backgroundColor = UIColor.clear()
        refreshController.tintColor = UIColor.clear()
        tableView.addSubview(refreshController)
        loadCustomRefreshContents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath as IndexPath)
        
        cell.textLabel!.text = dataArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Apple Color Emoji", size: 40)
        cell.textLabel?.textAlignment = .center
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func loadCustomRefreshContents() {
        let refreshContents = Bundle.main().loadNibNamed("RefreshContents", owner: self, options: nil)
        
        customView = refreshContents[0] as! UIView
        customView.frame = refreshController.bounds
        
        for i in 0 ..< customView.subviews.count {
            
            labelsArray.append(customView.viewWithTag(i + 1) as! UILabel)
            
        }
        
        refreshController.addSubview(customView)
    }
    
    func animateRefreshStep1() {
        
        isAnimationg = true
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
            
            self.labelsArray[self.currentLabelIndex].transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
            self.labelsArray[self.currentLabelIndex].textColor = self.getNextColor()
            
            }, completion: { (finished) -> Void in
                
                UIView.animate(withDuration: 0.05, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
                    self.labelsArray[self.currentLabelIndex].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                    self.labelsArray[self.currentLabelIndex].textColor = UIColor.black()
                    
                    }, completion: { (finished) -> Void in
                        self.currentLabelIndex += 1
                        
                        if self.currentLabelIndex < self.labelsArray.count {
                            self.animateRefreshStep1()
                        }
                        else {
                            self.animateRefreshStep2()
                        }
                })
        })
    }
    
    
    func animateRefreshStep2() {
        UIView.animate(withDuration: 0.40, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
            
            self.labelsArray[0].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[1].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[2].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[3].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[4].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[5].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[6].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[7].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[8].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[9].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[10].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[11].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            
            }, completion: { (finished) -> Void in
                
                UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
                    self.labelsArray[0].transform = CGAffineTransform.init(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
                    self.labelsArray[1].transform = CGAffineTransform.init(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
                    self.labelsArray[2].transform = CGAffineTransform.init(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
                    self.labelsArray[3].transform = CGAffineTransform.init(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
                    self.labelsArray[4].transform = CGAffineTransform.init(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
                    self.labelsArray[5].transform = CGAffineTransform.init(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
                    self.labelsArray[6].transform = CGAffineTransform.init(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
                    self.labelsArray[7].transform = CGAffineTransform.init(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
                    self.labelsArray[8].transform = CGAffineTransform.init(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
                    self.labelsArray[9].transform = CGAffineTransform.init(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
                    self.labelsArray[10].transform = CGAffineTransform.init(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
                    self.labelsArray[11].transform = CGAffineTransform.init(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
                    
                    }, completion: { (finished) -> Void in
                        if self.refreshController.isRefreshing {
                            self.currentLabelIndex = 0
                            self.animateRefreshStep1()
                        }
                        else {
                            self.isAnimationg = false
                            self.currentLabelIndex = 0
                            for i in 0 ..< self.labelsArray.count {
                                self.labelsArray[i].textColor = UIColor.black()
                                self.labelsArray[i].transform = CGAffineTransform.init(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
                            }
                        }
                })
        })
    }
    
    
    func getNextColor() -> UIColor {
        var colorsArray: Array<UIColor> = [UIColor.magenta(),UIColor.brown(),UIColor.yellow(),UIColor.red(),UIColor.green(),UIColor.blue(),UIColor.orange()]
        
        if currentColorIndex == colorsArray.count {
            currentColorIndex = 0;
        }
        let returnColor = colorsArray[currentColorIndex]
        currentColorIndex += 1;
        return returnColor
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if refreshController.isRefreshing {
            if !isAnimationg {
                doSomething()
                animateRefreshStep1()
            }
        }
    }
    
    func doSomething() {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(endedOfWork), userInfo: nil, repeats: true)
    }
    
    func endedOfWork() {
        refreshController.endRefreshing()
        timer.invalidate()
        timer = nil
    }
}

