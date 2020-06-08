//
//  ViewController.swift
//  AppearAnimatedDemo
//
//  Created by Tao on 2020/6/5.
//  Copyright © 2020 qxb154. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    let headetTitleArray = ["Presentation Transitions"]
    let cellTitleArray = ["淡入淡出", "滑动", "自定义Presentation","test"]
    let cellSubtitleArray = ["一种淡入淡出的动画", "一种交互式切换","使用presentation controller改变被展示的ViewController的布局","test"]
    
    var dataArr:[String] = [String]()
    lazy var tableView: UITableView = {
        let table = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "自定义页面跳转动画"
        dataArr = ["控制器动画","view动画"]
        view.addSubview(tableView)
        navigationItem.title = "自定义页面跳转动画"
        view.addSubview(tableView)
        self.modalPresentationStyle = .fullScreen
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }


}

// MARK: - 实现UITableViewDelegate协议
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nav: UINavigationController
        switch indexPath.row {
        case 0:
            nav = UINavigationController(rootViewController: CrossDissolveFirstViewController())
        case 1:
            nav = UINavigationController(rootViewController: InteractivityFirstViewController())
        case 2:
            nav = UINavigationController(rootViewController: CustomPresentationFirstViewController())
        case 3:
            nav = UINavigationController(rootViewController: testViewController())
        default:
            nav = UINavigationController()
            break
        }
        // http://stackoverflow.com/questions/22585416/slow-performance-for-presentviewcontroller-depends-on-complexity-of-presenting
        
        DispatchQueue.main.async {
//            self.modalPresentationStyle = .fullScreen
//            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        }
    }

}


// MARK: - 实现UITableViewDataSource协议
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "UITableViewCell")
        
        tableViewCell.textLabel?.text = cellTitleArray[indexPath.row]
        tableViewCell.detailTextLabel?.text = cellSubtitleArray[indexPath.row]
        tableViewCell.selectionStyle = .none
        return tableViewCell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return headetTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitleArray.count
        
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headetTitleArray[section]
    }
}
