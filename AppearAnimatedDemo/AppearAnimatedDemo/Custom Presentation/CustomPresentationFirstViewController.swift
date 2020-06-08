//
//  CustomPresentationFirstViewController.swift
//  AppearAnimatedDemo
//
//  Created by Tao on 2020/6/8.
//  Copyright © 2020 qxb154. All rights reserved.
//

import Foundation
import UIKit

class CustomPresentationFirstViewController: UIViewController {
    lazy var customPresentationSecondViewController: CustomPresentationSecondViewController = CustomPresentationSecondViewController()
    lazy var customPresentationController: CustomPresentationController = CustomPresentationController(presentedViewController: self.customPresentationSecondViewController, presenting: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView() // 主要是一些UI控件的布局，可以无视其实现细节
        
        customPresentationSecondViewController.transitioningDelegate = customPresentationController
    }
}


// MARK: - UI事件处理
extension CustomPresentationFirstViewController {
    @objc func animationButtonDidClicked() {
        self.present(customPresentationSecondViewController, animated: true, completion: nil)
    }
    
    @objc func leftBarButtonDidClicked() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - 对视图上的基本UI控件进行初始化，读者可以忽略
extension CustomPresentationFirstViewController {
    func setupView() {
        view.backgroundColor = UIColor.init(red: 224/255.0, green: 222/255.0, blue: 255/255.0, alpha: 1.0)// 设置背景颜色
        
        /// 设置navigationItem
        navigationItem.title = "自定义Presentation"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: UIBarButtonItem.Style.plain, target: self, action: #selector(leftBarButtonDidClicked))
        
        // 创建label
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
