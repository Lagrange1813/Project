//
//  ViewController.swift
//  PushAndPresent-Test
//
//  Created by 张维熙 on 2022/4/10.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    
    button.setTitle("Test", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.addTarget(self, action: #selector(callNew), for: .touchUpInside)
    
    view.addSubview(button)
  }

  @objc func callNew() {
    let vc = TestViewController()
    present(vc, animated: true)
    print("One")
    print("Two")
    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
      print("another")
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
      print("another again")
    }
    
  }

}

