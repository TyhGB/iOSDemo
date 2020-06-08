//
//  CustomPresentationSecondViewController.swift
//  AppearAnimatedDemo
//
//  Created by Tao on 2020/6/8.
//  Copyright © 2020 qxb154. All rights reserved.
//

import Foundation
import UIKit

class CustomPresentationSecondViewController: UIViewController {
    let slider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView() // 主要是一些UI控件的布局，可以无视其实现细节
        
        self.updatePreferredContentSizeWithTraitCollection(traitCollection: self.traitCollection)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - Layout
extension CustomPresentationSecondViewController {
    func updatePreferredContentSizeWithTraitCollection(traitCollection: UITraitCollection) {
        self.preferredContentSize = CGSize.init(width: self.view.bounds.size.width, height: traitCollection.verticalSizeClass == .compact ? 270 : 420)
        
        slider.maximumValue = Float(self.preferredContentSize.height)
        slider.minimumValue = 220
        slider.value = self.slider.maximumValue
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        self.updatePreferredContentSizeWithTraitCollection(traitCollection: newCollection)
    }
}

// MARK: - UI事件处理
extension CustomPresentationSecondViewController {
    @objc func buttonDidClicked() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func sliderValueChange(sender: UISlider) {
        self.preferredContentSize = CGSize.init(width: self.view.bounds.size.width, height: CGFloat(sender.value))
    }
}

// MARK: - 对视图上的基本UI控件进行初始化，读者可以忽略
extension CustomPresentationSecondViewController {
    func setupView() {
        view.backgroundColor =  UIColor.init(red: 224/255.0, green: 222/255.0, blue: 255/255.0, alpha: 1.0)// 设置背景颜色
        
        /// 创建label
        let label = UILabel()
        label.text = "To"
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 60)
        view.addSubview(label)
        label.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.top.equalTo(view)
            make.height.equalTo(144)
        }
        
        view.addSubview(slider)
        slider.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.left.equalTo(view).offset(20)
            make.height.equalTo(30)
        }
        slider.addTarget(self, action: #selector(sliderValueChange(sender:)), for: .valueChanged)
        
        /// 创建button
        let button = UIButton()
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitle("Dismiss", for: .normal)
        button.addTarget(self, action: #selector(buttonDidClicked), for: .touchUpInside)
        view.addSubview(button)
        button.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(view).offset(-20)
            make.top.equalTo(slider.snp_bottom).offset(8)
            make.centerX.equalTo(view)
            make.width.equalTo(245)
        }
    }
}
