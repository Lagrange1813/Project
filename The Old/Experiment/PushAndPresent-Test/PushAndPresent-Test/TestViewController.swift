//
//  TestViewController.swift
//  PushAndPresent-Test
//
//  Created by 张维熙 on 2022/4/10.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      print("View did load")
    }
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("View will appear")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("View did appear")
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    print("View will layout subview")
  }
}
