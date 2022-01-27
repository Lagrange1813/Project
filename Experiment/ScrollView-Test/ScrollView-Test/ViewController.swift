//
//  ViewController.swift
//  ScrollView-Test
//
//  Created by 张维熙 on 2022/1/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGray
        
        configureToolBar()
    }

    func configureToolBar() {
        let toolBar = UIScrollView(frame: CGRect(x: 50, y: 100, width: 300, height: 50))
        toolBar.backgroundColor = .blue
        toolBar.clipsToBounds = true
        toolBar.isScrollEnabled = true
        toolBar.contentSize = CGSize(width: 600, height: 50)
        view.addSubview(toolBar)
        
        let backView = UIView(frame: CGRect(x: 10, y: 10, width: 550, height: 35))
        backView.backgroundColor = .white
        toolBar.addSubview(backView)
    }
}

