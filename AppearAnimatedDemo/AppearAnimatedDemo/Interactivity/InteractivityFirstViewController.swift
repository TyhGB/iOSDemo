//
//  InteractivityFirstViewController.swift
//  AppearAnimatedDemo
//
//  Created by Tao on 2020/6/8.
//  Copyright © 2020 qxb154. All rights reserved.
//

import Foundation
import UIKit

class InteractivityFirstViewController: UIViewController {
    lazy var interactivitySecondViewController: InteractivitySecondViewController = InteractivitySecondViewController()
    lazy var customTransitionDelegate: InteractivityTransitionDelegate = InteractivityTransitionDelegate()
    lazy var interactiveTransitionRecognizer: UIScreenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer.init(target: self, action: #selector(interactiveTransitionRecognizerAction(sender:)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView() // 主要是一些UI控件的布局，可以无视其实现细节
        
        /// 添加滑动交互手势
        interactiveTransitionRecognizer.edges = .right
        self.view.addGestureRecognizer(interactiveTransitionRecognizer)
        
        /// 设置动画代理
        interactivitySecondViewController.transitioningDelegate = customTransitionDelegate
        interactivitySecondViewController.modalPresentationStyle = .fullScreen
    }
}


// MARK: - 手势识别
extension InteractivityFirstViewController {
    @objc func interactiveTransitionRecognizerAction(sender: UIScreenEdgePanGestureRecognizer) {
        /**
        *  在开始触发手势时，调用animationButtonDidClicked方法，只会调用一次
        */
        if sender.state == .began {
            self.animationButtonDidClicked(sender: sender)
        }
    }
}

// MARK: - 处理UI控件的点击事件
extension InteractivityFirstViewController {
    /**
     这个函数可以在按钮点击时触发，也可以在手势滑动时被触发，通过sender的类型来判断具体是那种情况
     如果是通过滑动手势触发，则需要设置customTransitionDelegate的gestureRecognizer属性
     
     :param: sender 事件的发送者，可能是button，也有可能是手势
     */
    @objc func animationButtonDidClicked(sender: AnyObject) {
        if sender is UIGestureRecognizer {
            customTransitionDelegate.gestureRecognizer = interactiveTransitionRecognizer
            
        }
        else {
            customTransitionDelegate.gestureRecognizer = nil
        }
        /// 设置targetEdge为右边，也就是检测从右边向左滑动的手势
        customTransitionDelegate.targetEdge = .right
        self.present(interactivitySecondViewController, animated: true, completion: nil)
    }
    
    @objc func leftBarButtonDidClicked() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - 对视图上的基本UI控件进行初始化，读者可以忽略
extension InteractivityFirstViewController {
    func setupView() {
        view.backgroundColor = UIColor.init(red: 224/255.0, green: 222/255.0, blue: 255/255.0, alpha: 1.0)// 设置背景颜色
        
        /// 设置navigationItem
        navigationItem.title = "交互式动画"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(leftBarButtonDidClicked))
        
        /// 创建label
        let label = UILabel()
        label.text = "From"
        label.font = UIFont(name: "Helvetica", size: 60)
        view.addSubview(label)
        label.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(view)
            make.width.equalTo(150)
            make.height.equalTo(60)
        }
        
        /// 创建button
        let button = UIButton()
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitle("演示动画", for: .normal)
        button.addTarget(self, action: #selector(animationButtonDidClicked(sender:)), for: .touchUpInside)
        view.addSubview(button)
        button.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.width.equalTo(250)
            make.height.equalTo(60)
            make.bottom.equalTo(view).offset(-40)
        }
    }
}
