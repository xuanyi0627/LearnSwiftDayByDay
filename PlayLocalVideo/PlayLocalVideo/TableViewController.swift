//
//  TableViewController.swift
//  PlayLocalVideo
//
//  Created by Echo on 16/4/18.
//  Copyright © 2016年 LiuXuanyi. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class TableViewController: UITableViewController {
    
    let cellIdentifer = "Cell"
    let data = [
        
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "t - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
        
    ]
    
    var playViewController = AVPlayerViewController()
    var playView = AVPlayer()
    
    let screenW = UIScreen.mainScreen().bounds.size.width
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 220*screenW/375
        tableView.estimatedRowHeight = 220*screenW/375
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer, forIndexPath: indexPath) as! VideoCell

        let video = data[indexPath.row]
        
        cell.bgImageView.image = UIImage.init(named: video.image)
        cell.titleLabel.text = video.title
        cell.timeLabel.text = video.source
        cell.playButton.tag = indexPath.row
        cell.playButton.addTarget(self, action:#selector(TableViewController.PlayButtonPress), forControlEvents: .TouchUpInside)

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        PlayButtonPress()
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: UIView = UIView.init(frame: CGRectMake(0, 0, screenW, 1))
        return headerView
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView: UIView = UIView.init(frame: CGRectMake(0, 0, screenW, 1))
        return headerView
    }
    
    func PlayButtonPress() {
        let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
        playView = AVPlayer.init(URL: NSURL.fileURLWithPath(path!))
        playViewController.player = playView
        self.presentViewController(playViewController, animated: true) { 
            self.playViewController.player?.play()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
