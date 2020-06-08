//
//  CrossDissolveAnimator.swift
//  AppearAnimatedDemo
//
//  Created by Tao on 2020/6/8.
//  Copyright © 2020 qxb154. All rights reserved.
//

import Foundation
import UIKit

class CrossDissolveAnimator: UIViewController ,UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.35
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let containerView = transitionContext.containerView
        
        var fromView = fromViewController?.view
        var toView = toViewController?.view
        
//        if transitionContext.responds(to: Selector("viewForKey:")) {
//            fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
//            toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
//        }
        
        fromView?.frame = transitionContext.initialFrame(for: fromViewController!)
        toView?.frame = transitionContext.finalFrame(for: toViewController!)
        
        fromView?.alpha = 1.0
        toView?.alpha = 0.0
        
        containerView.addSubview(toView!)
        
        let transitionDuration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: transitionDuration, animations: {
            fromView!.alpha = 0.0
            toView!.alpha = 1.0
        }) { (finished: Bool) -> Void in
            let wasCancelled = transitionContext.transitionWasCancelled
//            if !wasCancelled {
//                for item in containerView.subviews {
////                    item.removeFromSuperview()
//                    print("end View:\(item)")
//                }
//            }
            transitionContext.containerView.bringSubviewToFront(toView!)
            transitionContext.completeTransition(!wasCancelled)
        }
    }
    
    
}
