//
//  ViewController.swift
//  Airplane
//
//  Created by 张维熙 on 2021/12/2.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
        view.backgroundColor = .systemBlue
    }

    override var shouldAutorotate:Bool{
        return false
    }
}

