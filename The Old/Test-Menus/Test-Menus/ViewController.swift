//
//  ViewController.swift
//  Test-Menus
//
//  Created by 张维熙 on 2021/11/24.
//

import UIKit


class ViewController: UIViewController {
    override func viewWillLayoutSubviews() {
        let width = self.view.frame.width
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 40, width: width, height: 44))
        self.view.addSubview(navigationBar)
        let navigationItem = UINavigationItem(title: "Navigation bar")
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(selectorX))
        navigationItem.rightBarButtonItem = doneBtn
        navigationBar.setItems([navigationItem], animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    @objc func selectorX() { }
}

