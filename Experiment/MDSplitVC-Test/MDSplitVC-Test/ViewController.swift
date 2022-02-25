//
//  ViewController.swift
//  MDSplitVC-Test
//
//  Created by 张维熙 on 2022/2/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let test = MDContainerView(style: .doubleColumn)
        self.addChild(test)
        self.view.addSubview(test.view)
        
        
        test.view.frame = self.view.bounds
        test.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        test.didMove(toParent: self)
        
    }


}

