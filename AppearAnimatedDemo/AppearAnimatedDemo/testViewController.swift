//
//  testViewController.swift
//  AppearAnimatedDemo
//
//  Created by Tao on 2020/6/8.
//  Copyright © 2020 qxb154. All rights reserved.
//

import Foundation
import UIKit

class testViewController: UIViewController {
    
    let twoVC = testTwoViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let btn = UIButton.init(type: .system)
        btn.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        btn.setTitle("presetn", for: .normal)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        view.addSubview(btn)
        btn.center = view.center
        twoVC.transitioningDelegate = self
        twoVC.modalPresentationStyle = .automatic
    }
    
    @objc func btnClick ()  {
        self.present(twoVC, animated: true, completion: nil)
    }
}

extension testViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return testAniamtedTransition()
    }
    
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return testAniamtedTransition()
//    }
    
//    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//
//    }
//    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//
//    }
    
}
