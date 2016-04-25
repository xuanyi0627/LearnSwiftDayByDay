//
//  VideoCutter.swift
//  SpotifyVideoBackground
//
//  Created by Echo on 16/4/25.
//  Copyright © 2016年 LiuXuanyi. All rights reserved.
//

import UIKit
import AVFoundation

extension String {
    var convert: NSString { return (self as NSString) }
    
}

public class VideoCutter: NSObject {

    public func cropVideoWithUrl(videoUrl url: NSURL, startTime: CGFloat, duration: CGFloat, completion: ((videoPath: NSURL?, error: NSError?) -> Void)?) {
    
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) { 
            
            let asset = AVURLAsset.init(URL: url, options: nil)
            let exportSession = AVAssetExportSession.init(asset: asset, presetName: "AVAssetExportPresetHighestQuality")
            
            let paths: NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
            
            var outputUrl = paths.objectAtIndex(0) as! String
            let manager = NSFileManager.defaultManager()
            do {
                try manager.createDirectoryAtPath(outputUrl, withIntermediateDirectories: true, attributes: nil)
            } catch _ {
                
            }
            
            outputUrl = outputUrl.convert.stringByAppendingPathComponent("output.mp4")
            
            do {
                try manager.removeItemAtPath(outputUrl)
            } catch _ {
            }
        
            if let exportSession = exportSession as AVAssetExportSession? {
                exportSession.outputURL = NSURL.init(fileURLWithPath: outputUrl)
                exportSession.shouldOptimizeForNetworkUse = true
                exportSession.outputFileType = AVFileTypeMPEG4
                let start = CMTimeMakeWithSeconds(Float64(startTime), 600)
                let duration = CMTimeMakeWithSeconds(Float64(duration), 600)
                let range = CMTimeRangeMake(start, duration)
                exportSession.timeRange = range
                exportSession.exportAsynchronouslyWithCompletionHandler({
                    switch exportSession.status {
                    case .Completed:
                        completion?(videoPath: exportSession.outputURL, error: nil)
                    case .Failed:
                        print("Failed: \(exportSession.error?.localizedDescription)")
                    case .Cancelled:
                        print("Failed: \(exportSession.error?.localizedDescription)")
                    default:
                        print("default case")
                    }
                })
            }
        }
        dispatch_async(dispatch_get_main_queue()) {
            
        }
    }
}
