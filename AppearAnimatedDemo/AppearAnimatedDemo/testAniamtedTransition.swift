//
//  testAniamtedTransition.swift
//  AppearAnimatedDemo
//
//  Created by Tao on 2020/6/8.
//  Copyright © 2020 qxb154. All rights reserved.
//

import Foundation
import UIKit

class testAniamtedTransition:NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let contaionView = transitionContext.containerView
        let fromView =  fromVC?.view
        let toView = toVC?.view
        print("from:\(String(describing: fromView)) to:\(String(describing: toView))")
        
        for item in contaionView.subviews {
            print("startAnimation! list container subviews: \(item)")
        }
        toView?.alpha = 0
        contaionView.addSubview(toView!)
        contaionView.bringSubviewToFront(fromView!)
        
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            fromView!.alpha = 0.0;
            fromView!.transform = CGAffineTransform.init(scaleX: 0.2, y: 0.2);
            toView!.alpha = 1.0;
        }) { (finished) in
            fromView!.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            transitionContext.completeTransition(true)
            for item in contaionView.subviews {
                print("endAnimation! list container subviews: \(item)")
            }

        }
        
    }
    
}
