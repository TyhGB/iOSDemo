//
//  CrossDissolveFirstViewController.swift
//  AppearAnimatedDemo
//
//  Created by Tao on 2020/6/8.
//  Copyright © 2020 qxb154. All rights reserved.
//

import Foundation
import UIKit

class CrossDissolveFirstViewController: UIViewController{
    lazy var crossDissolveSecondViewController: CrossDissolveSecondViewController = CrossDissolveSecondViewController()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           setupView() // 主要是一些UI控件的布局，可以无视其实现细节
           
           /// 为了使用自定义present动画进行的一些设置
        crossDissolveSecondViewController.modalPresentationStyle = .fullScreen
        crossDissolveSecondViewController.transitioningDelegate = self  // 设置动画代理，这里的代理就是这个类自己
        
        crossDissolveSecondViewController.dismissClosure = { [unowned self] in
            self.crossDissolveSecondViewController.dismiss(animated: true, completion: nil)
        }
       }
}


extension CrossDissolveFirstViewController:UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return HalfWaySpringAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CrossDissolveAnimator()
    }
}
// MARK: - 处理UI控件的点击事件
extension CrossDissolveFirstViewController {
    @objc func animationButtonDidClicked() {
        self.present(crossDissolveSecondViewController, animated: true, completion: nil)
        
    }
    
    @objc func leftBarButtonDidClicked() {
        self.dismiss(animated:true , completion:nil)
    }
}
// MARK: - 对视图上的基本UI控件进行初始化，读者可以忽略
extension CrossDissolveFirstViewController {
    func setupView() {
        view.backgroundColor = UIColor.init(red: 224/255.0, green: 222/255.0, blue: 255/255.0, alpha: 1.0)// 设置背景颜色
        
        /// 设置navigationItem
        navigationItem.title = "淡入淡出"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action:#selector(leftBarButtonDidClicked))
        
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
        button.addTarget(self, action: #selector(animationButtonDidClicked), for: .touchUpInside)

        view.addSubview(button)
        button.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.width.equalTo(250)
            make.height.equalTo(60)
            make.bottom.equalTo(view).offset(-40)
        }
    }
}
