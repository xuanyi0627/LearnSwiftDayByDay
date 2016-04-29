//
//  ViewController.swift
//  EmojiMachine
//
//  Created by Echo on 16/4/29.
//  Copyright © 2016年 LiuXuanyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var emojiPickerView: UIPickerView!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var imageArr = [String]()
    var dataArr = [Int]()
    var dataArr2 = [Int]()
    var dataArr3 = [Int]()
    var bounds: CGRect = CGRectZero
    
    @IBAction func goButtonAction(sender: UIButton) {
        emojiPickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 0, animated: true)
        emojiPickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 1, animated: true)
        emojiPickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 2, animated: true)
        
        if dataArr[emojiPickerView.selectedRowInComponent(0)] == dataArr2[emojiPickerView.selectedRowInComponent(1)] && dataArr2[emojiPickerView.selectedRowInComponent(1)] == dataArr3[emojiPickerView.selectedRowInComponent(2)]  && dataArr[emojiPickerView.selectedRowInComponent(0)] == dataArr3[emojiPickerView.selectedRowInComponent(2)]  {
            self.resultLabel.text = "Bingo"
        }
        else {
            self.resultLabel.text = "💔"
        }
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .CurveLinear, animations: {
            
                self.goButton.bounds = CGRect.init(x: self.bounds.origin.x, y: self.bounds.origin.y , width: self.bounds.size.width+20 , height: self.bounds.size.height)
            }, completion: { (completion: Bool) in
            
                UIView.animateWithDuration(0.1, delay: 0.0, options: .CurveEaseInOut, animations: {
                        self.goButton.bounds = self.bounds
                    
                    }, completion: nil)
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        bounds = goButton.bounds
        
        imageArr = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        
        for _ in 0 ..< 100 {
            dataArr.append((Int)(arc4random() % 10))
            dataArr2.append((Int)(arc4random() % 10))
            dataArr3.append((Int)(arc4random() % 10))
        }
        
        resultLabel.text = ""
        
        emojiPickerView.delegate = self
        emojiPickerView.dataSource = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: .CurveEaseOut, animations: {
            
                self.goButton.alpha = 1
            }, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        switch component {
        case 0:
            pickerLabel.text = imageArr[(Int)(dataArr[row])]
        case 1:
            pickerLabel.text = imageArr[(Int)(dataArr2[row])]
        case 2:
            pickerLabel.text = imageArr[(Int)(dataArr3[row])]
        default:
            pickerLabel.text = ""
        }
        
        pickerLabel.font = UIFont.init(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = .Center
        
        return pickerLabel
    }

}

