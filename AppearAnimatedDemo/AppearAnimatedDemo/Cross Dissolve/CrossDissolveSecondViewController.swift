//
//  CrossDissolveSecondViewController.swift
//  AppearAnimatedDemo
//
//  Created by Tao on 2020/6/8.
//  Copyright © 2020 qxb154. All rights reserved.
//

import Foundation
import UIKit

class CrossDissolveSecondViewController: UIViewController {
    var dismissClosure : (()->(Void))?
    
    override func viewDidLoad() {
           super.viewDidLoad()
           setupView() // 主要是一些UI控件的布局，可以无视其实现细节
       }
}
// MARK: - 处理UI控件的点击事件
extension CrossDissolveSecondViewController {
    @objc func buttonDidClicked() {
        /**
        *  应该由FirstVC执行下面这行代码，为了保持demo简单，突出重点，这里的写法其实是不严格的，请见谅
        */
//        self.dismiss(animated: true, completion: nil)
        if let closure =  self.dismissClosure {
            closure()
        }
    }
}
// MARK: - 对视图上的基本UI控件进行初始化，读者可以忽略
extension CrossDissolveSecondViewController {
    func setupView() {
        view.backgroundColor = UIColor.init(red: 224/255.0, green: 222/255.0, blue: 255/255.0, alpha: 1.0)   // 设置背景颜色
        
        /// 创建label
        let label = UILabel()
        label.text = "To"
        label.textAlignment = .center
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
        button.setTitle("Dismiss", for: .normal)
        button.addTarget(self, action: #selector(buttonDidClicked), for: .touchUpInside)
        view.addSubview(button)
        button.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.width.equalTo(250)
            make.height.equalTo(60)
            make.bottom.equalTo(view).offset(-40)
        }
    }
}
