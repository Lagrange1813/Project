//
//  ViewController.swift
//  StackedView-Test
//
//  Created by 张维熙 on 2022/3/27.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    var view1 = UIView(frame: CGRect(x: 80, y: 80, width: 100, height: 100))
    view1.backgroundColor = .red
    view.addSubview(view1)
    
//    view1.removeFromSuperview()
    
    let view2 = UIView(frame: CGRect(x: 130, y: 130, width: 100, height: 100))
    view2.backgroundColor = .yellow
    view.insertSubview(view2, belowSubview: view1)
    
    let view3 = UIView(frame: CGRect(x: 160, y: 160, width: 100, height: 100))
    view3.backgroundColor = .green
    view.insertSubview(view3, belowSubview: view2)
    
    print(view.subviews.count)
    
    let view4 = UIView(frame: CGRect(x: 120, y: 80, width: 100, height: 100))
    view4.backgroundColor = .blue
    view.insertSubview(view4, at: 0)
    view.inser
    
//    view1.removeFromSuperview()
//
//    view1 = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//    view1.backgroundColor = .black
//    view.insertSubview(view1, at: 1)
//
    
    
//    var viewsub = UIView(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
//    viewsub.backgroundColor = .purple
//    view1.addSubview(viewsub)
//
//    viewsub.removeFromSuperview()
//
//    viewsub = UIView(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
//    viewsub.backgroundColor = .brown
//    view1.addSubview(viewsub)
    
//    view1.backgroundColor = .gray

  }
  
//  func replace(_ oldView: UIView, with newView: UIView) {
//    view.addSubview(newView)
//    view.exchangeSubview(at: <#T##Int#>, withSubviewAt: <#T##Int#>)
//  }

}



