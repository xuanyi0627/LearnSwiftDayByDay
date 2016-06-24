//
//  MainViewController.swift
//  TumblrMenu
//
//  Created by Xuanyi Liu on 16/6/23.
//  Copyright © 2016年 Xuanyi Liu. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    
    
    //96,68
    var menuButton: UIButton = UIButton(frame: CGRect.init(x: (UIScreen.main().bounds.size.width-48)/2, y: UIScreen.main().bounds.size.height-40, width: 48, height: 34))
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .default
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true

        self.tableView.separatorStyle = .none
        
        menuButton.setImage(UIImage(named: "newPost"), for: .selected)
        menuButton.isSelected = true
        menuButton.addTarget(self, action: #selector(handleDrag(sender:)), for: .touchUpInside)
        UIApplication.shared().keyWindow?.addSubview(menuButton)
        UIApplication.shared().keyWindow?.bringSubview(toFront: menuButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainViewCell

        if indexPath.row == 0 {
            cell.avatarImageView.image = UIImage(named: "hugo")
            cell.titleLabel.text = "hugo"
            cell.headerImageView.image = UIImage(named: "1")
        }
        else {
            cell.avatarImageView.image = UIImage(named: "mengto")
            cell.titleLabel.text = "MengTo"
            cell.headerImageView.image = UIImage(named: "2")
        }

        return cell
    }
    
    @IBAction func unwindToMainViewController (sender: UIStoryboardSegue) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func handleDrag(sender: AnyObject) {
        self.performSegue(withIdentifier: "toMenuViewPush", sender: nil)
    }
}
