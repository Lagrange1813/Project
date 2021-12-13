//
//  ViewController.swift
//  Timer-Test
//
//  Created by 张维熙 on 2021/12/13.
//

import UIKit

class ViewController: UIViewController {
    var cnt = 0
    var square: UIView!
    let test = Queue<UIView>()
    var x = 100
    var y = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//            print("我默认已经加入到Runloop中了")
//        }
//
//        let timer2 = Timer(timeInterval: 1, repeats: true) { _ in
//            print("我需要手动加入到Runloop中")
//        }
//        RunLoop.current.add(timer2, forMode: .default)

        let button = UIButton(frame: CGRect(x: view.center.x, y: view.center.y, width: 50, height: 50))
        button.setTitle("test", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.addTarget(self, action: #selector(addTimer), for: .touchUpInside)
        view.addSubview(button)
        
        
    }

    @objc func addTimer() {
        let newSquare = UIView(frame: CGRect(x: x, y: y, width: 50, height: 50))
        newSquare.backgroundColor = .systemBlue
        square = newSquare
        view.addSubview(square)
        test.enqueue(square)
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            let viewOfTest = self.test.dequeue()
            viewOfTest.isHidden = true
        }
        
        x += 20
        y += 20
//        cnt += 1
//
//        var innerCnt = 0
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//            let test = self.cnt
//            innerCnt += 1
//            print("这是第\(test)次的第\(innerCnt)回")
//        }
    }
}
