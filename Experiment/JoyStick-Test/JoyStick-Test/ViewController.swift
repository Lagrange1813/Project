//
//  ViewController.swift
//  JoyStick-Test
//
//  Created by 张维熙 on 2021/12/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        let test = JoyStick(center: CGPoint(x: 150, y: 150), cornerRadius: 60.0)
        view.addSubview(test)
        
        let outView = Test(frame: CGRect(x: 200, y: 300, width: 200, height: 200))
        outView.backgroundColor = .gray
        view.addSubview(outView)
        
    }


}

