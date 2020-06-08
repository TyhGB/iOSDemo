//
//  testTwoViewController.swift
//  AppearAnimatedDemo
//
//  Created by Tao on 2020/6/8.
//  Copyright © 2020 qxb154. All rights reserved.
//

import Foundation
import UIKit

class testTwoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
//        self.transitioningDelegate = self
        
    }
}

extension testTwoViewController: UIViewControllerTransitioningDelegate {
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return HalfWaySpringAnimator()
//    }
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return CrossDissolveAnimator()
//    }
}
