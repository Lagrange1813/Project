//
//  ViewController.swift
//  SnapKitTest
//
//  Created by Lagrange1813 on 2021/11/5.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let testView = UIView()
        testView.backgroundColor = UIColor.cyan
        view.addSubview(testView)
        testView.snp.makeConstraints { (make) in
            make.width.equalTo(100)         // 宽为100
            make.height.equalTo(100)        // 高为100
            make.center.equalTo(view)       // 位于当前视图的中心
        }

    }
}