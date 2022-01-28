//
//  ViewController.swift
//  TextViewDOUBLE-Test
//
//  Created by 张维熙 on 2022/1/28.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    var backTextView: TestView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        
        backTextView = TestView(frame: CGRect(x: 0, y: 44, width: view.frame.width, height: view.frame.height-100))
//        backTextView.backgroundColor = 
        view.addSubview(backTextView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        backTextView.resize()
    }

    func textViewDidChange(_ textView: UITextView) {
        print("no")
    }

}

