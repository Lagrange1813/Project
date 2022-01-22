//
//  ViewController.swift
//  frame&bounds
//
//  Created by 张维熙 on 2021/12/1.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let blueView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        blueView.backgroundColor = .blue
        let greenView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        greenView.backgroundColor = .green
        greenView.alpha = 0.5
        let yellowView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        yellowView.backgroundColor = .yellow
        view.addSubview(blueView)
        view.addSubview(greenView)
        blueView.addSubview(yellowView)
        
//        blueView.bounds.size = CGSize(width: 250, height: 250)
        blueView.frame.origin = CGPoint(x: 100, y: 100)
        greenView.frame.origin = CGPoint(x: 100, y: 100)
//        greenView.frame.origin = CGPoint(x: 50, y: 50)
//        blueView.frame.size = CGSize(width: 10, height: 10)
        blueView.bounds.origin = CGPoint(x: 20, y: 20)
        yellowView.frame.origin = CGPoint(x: 30, y: 30)
        
        print("Bb:", blueView.bounds)
        print("Bf:", blueView.frame)
        print("Yb:", yellowView.bounds)
        print("Yf:", yellowView.frame)
    }


}

