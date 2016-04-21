//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Echo on 16/4/21.
//  Copyright © 2016年 LiuXuanyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellIdentifer = "Cell"
    let favouriteList = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    var moreList = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var emojiData = [String]()
    
    var tableViewController = UITableViewController.init(style: .Plain);
    var refreshControl = UIRefreshControl()
    
    var navBar = UINavigationBar.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 64))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        emojiData = favouriteList
        
        let tableView = tableViewController.tableView
        tableView.frame = CGRectMake(0, 44, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
        
        tableView.backgroundColor = UIColor.blackColor()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
        
        tableViewController.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: #selector(ViewController.didRoadEmoji), forControlEvents: .ValueChanged)
        
        self.refreshControl.backgroundColor = UIColor.blueColor()
        let attributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.refreshControl.attributedTitle = NSAttributedString.init(string: "Last update on \(NSDate())", attributes: attributes)
        self.refreshControl.tintColor = UIColor.whiteColor()
        
        self.title = "EMOJI"
        
        self.navBar.barStyle = .BlackTranslucent
        
        tableView.estimatedRowHeight = 70
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView.init(frame: CGRectZero)
        tableView.separatorStyle = .None
        
        self.view.addSubview(tableView)
        self.view.addSubview(navBar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer)! as UITableViewCell
        cell.textLabel?.text = emojiData[indexPath.row]
        cell.textLabel?.font = UIFont.systemFontOfSize(50)
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = .None
        return cell
    }
    
    func didRoadEmoji() {
        
        for item in moreList {
            emojiData.append(item)
        }
        self.tableViewController.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}

