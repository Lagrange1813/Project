//
//  ViewController.swift
//  Sqlite-Test
//
//  Created by 张维熙 on 2021/12/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let idText = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 20))
        let scoreText = UILabel(frame: CGRect(x: 100, y: 130, width: 200, height: 20))
        let timeText = UILabel(frame: CGRect(x: 100, y: 160, width: 200, height: 20))
        view.addSubview(idText)
        view.addSubview(scoreText)
        view.addSubview(timeText)

        let button = UIButton(frame: CGRect(x: 100, y: 210, width: 200, height: 20))
        button.setTitle("Test", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        view.addSubview(button)
        
        let button1 = UIButton(frame: CGRect(x: 100, y: 250, width: 200, height: 20))
        button1.setTitle("Print", for: .normal)
        button1.setTitleColor(.systemBlue, for: .normal)
        button1.setTitleColor(.gray, for: .highlighted)
        view.addSubview(button1)
        
        button.addTarget(self, action: #selector(addScore), for: .touchUpInside)
        button1.addTarget(self, action: #selector(printScore), for: .touchUpInside)
        
        
        
        let date = Date()
        print(date.formatted())
    }

    @objc func addScore() {
        Test.insertRecord(200)
    }
    
    @objc func printScore() {
        Test.getRecord()
    }
}

