//
//  MenuTransitionManager.swift
//  TumblrMenu
//
//  Created by Xuanyi Liu on 16/6/24.
//  Copyright © 2016年 Xuanyi Liu. All rights reserved.
//

import UIKit

class MenuTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {

    private var presenting = false
    
    func animateTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView()
        
        let screens : (from:UIViewController, to:UIViewController) = (transitionContext.viewController(forKey: UITransitionContextFromViewControllerKey)!, transitionContext.viewController(forKey: UITransitionContextToViewControllerKey)!)
        
        let menuViewController = !self.presenting ? screens.from as! MenuViewController : screens.to as! MenuViewController
        let bottonViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
        
        let menuView = menuViewController.view
        let bottomView = bottonViewController.view
        
        if self.presenting {
            self.offStageMenuController(menuViewController: menuViewController)
        }
        
        container.addSubview(bottomView!)
        container.addSubview(menuView!)
        
        let duration = self.transitionDuration(transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations: {
            
            if self.presenting {
                self.onStageMenuViewController(menuViewController: menuViewController)
            }
            else {
                self.offStageMenuController(menuViewController: menuViewController)
            }
            
            }, completion: { finished in
            
            transitionContext.completeTransition(true)
            UIApplication.shared().keyWindow!.addSubview(screens.to.view)
            
            })
    }
    
    
    func offstage(amount: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(translationX: amount, y: 0)
    }
    
    func offStageMenuController(menuViewController: MenuViewController) {
        menuViewController.view.alpha = 0;
        
        let topRowOffset : CGFloat = 300
        let middleRowOffset : CGFloat = 150
        let bottomRowOffset : CGFloat = 50
        
        menuViewController.textButton.transform = self.offstage(amount: -topRowOffset)
        menuViewController.textLabel.transform = self.offstage(amount: -topRowOffset)
        
        menuViewController.quoteButton.transform = self.offstage(amount: -middleRowOffset)
        menuViewController.quoteLabel.transform = self.offstage(amount: -middleRowOffset)
        
        menuViewController.chatButton.transform = self.offstage(amount: -bottomRowOffset)
        menuViewController.chatLabel.transform = self.offstage(amount: -bottomRowOffset)
        
        menuViewController.photoButton.transform = self.offstage(amount: topRowOffset)
        menuViewController.photoLabel.transform = self.offstage(amount: topRowOffset)
        
        menuViewController.linkButton.transform = self.offstage(amount: middleRowOffset)
        menuViewController.linkLabel.transform = self.offstage(amount: middleRowOffset)
        
        menuViewController.audioButton.transform = self.offstage(amount: bottomRowOffset)
        menuViewController.audioLabel.transform = self.offstage(amount: bottomRowOffset)
    }
    
    func onStageMenuViewController(menuViewController: MenuViewController) {
        
        menuViewController.view.alpha = 1
        
        let identity: CGAffineTransform = CGAffineTransform.init(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
        menuViewController.textButton.transform = identity
        menuViewController.textLabel.transform = identity
        
        menuViewController.quoteButton.transform = identity
        menuViewController.quoteLabel.transform = identity
        
        menuViewController.chatButton.transform = identity
        menuViewController.chatLabel.transform = identity
        
        menuViewController.photoButton.transform = identity
        menuViewController.photoLabel.transform = identity
        
        menuViewController.linkButton.transform = identity
        menuViewController.linkLabel.transform = identity
        
        menuViewController.audioButton.transform = identity
        menuViewController.audioLabel.transform = identity

    }
    
    func transitionDuration(_ transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animationController(forPresentedController presented: UIViewController, presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    func animationController(forDismissedController dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
}
