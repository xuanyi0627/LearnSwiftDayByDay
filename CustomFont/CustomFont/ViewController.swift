//
//  ViewController.swift
//  CustomFont
//
//  Created by Echo on 16/4/18.
//  Copyright © 2016年 LiuXuanyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var changeFontButton: UIButton!

    let data = ["Learn", "Swift", "Day", "By", "Day"]
    let fontList = ["Flow", "Abyssopelagic", "MoskLight300"]
    var fontRowIndex = 0
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeFontButton.layer.masksToBounds = true
        changeFontButton.layer.cornerRadius = 45
        
        tableView.rowHeight = 50.0
        tableView.estimatedRowHeight = 50.0
        
        loadAllFont();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.font = UIFont(name:fontList[fontRowIndex], size: 17)
        cell.textLabel?.textColor = UIColor.whiteColor()
        return cell
    }
    
    @IBAction func changeButtonPress(sender: AnyObject) {
        fontRowIndex = (fontRowIndex + 1) % 3
        tableView.reloadData()
    }
    
    func loadAllFont() {
        let familyNames = UIFont.familyNames()
        for name in familyNames {
            print("####################Family name \(name)")
            let fontNames = UIFont.fontNamesForFamilyName(name)
            for item in fontNames {
                print("-------------------- Font name \(item)")
            }
        }
    }
    
    
}
