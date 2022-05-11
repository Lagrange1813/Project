//
//  ViewController.swift
//  AutoLayout-Test
//
//  Created by 张维熙 on 2022/4/8.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  var view1: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .lightGray
    
    view1 = UIView()
    view1.backgroundColor = .blue
    view.addSubview(view1)
    
    view1.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(100)
      make.top.equalToSuperview().offset(100)
      make.width.equalTo(100)
      make.height.equalTo(100)
    }
    
    
//    view1.frame.origin.x += 100
    
    let button = UIButton(frame: CGRect(x: 100, y: 200, width: 50, height: 50))
    button.setTitle("Test", for: .normal)
    view.addSubview(button)
    
    button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
    
  }

  @objc func buttonClick() {
//    self.view1.frame.origin.x += 100
    self.view1.frame = CGRect(x: 200, y: 200, width: 50, height: 50)
//    UIView.animate(withDuration: 0.5, animations: {
//      self.view1.frame.origin.x += 100
//    })
  }

}

