//
//  ViewController.swift
//  LongTouchMove
//
//  Created by 张维熙 on 2021/12/13.
//

import UIKit

class ViewController: UIViewController {

    var testView: UIView!
    var timer: Timer!
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        configureView()
        configureController()
    }
    
    func configureView() {
        testView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        testView.backgroundColor = .systemBlue
        view.addSubview(testView)
    }
    
    func configureController() {
        
        
        let controller = UIButton(frame: CGRect(x: 250, y: 300, width: 100, height: 50))
        controller.setTitle("controller", for: .normal)
        controller.setTitleColor(.systemBlue, for: .normal)
        controller.setTitleColor(.gray, for: .highlighted)
        controller.addTarget(self, action: #selector(controlView), for: .touchDown)
        view.addSubview(controller)
        
        let controller2 = UIButton(frame: CGRect(x: 250, y: 500, width: 50, height: 50))
        controller2.setTitle("reset", for: .normal)
        controller2.setTitleColor(.systemBlue, for: .normal)
        controller2.setTitleColor(.gray, for: .highlighted)
        controller2.addTarget(self, action: #selector(resetView), for: .touchUpInside)
        view.addSubview(controller2)
        
        let catcher = UILongPressGestureRecognizer(target: self, action: #selector(longTouch))
        controller.addTarget(self, action: #selector(cancelTouch), for: .touchUpInside)
        controller.addGestureRecognizer(catcher)
    }
    
    @objc func controlView() {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations: {
            self.testView.center.y += 100
        }, completion: nil)
        print("touchdown")
    }
    
    @objc func resetView() {
        UIView.animate(withDuration: 0.33, delay: 0.0, options: [], animations: {
            self.testView.frame.origin.y = 100
        }, completion: nil)
//        if let test = timer {
//            test.invalidate()
//            flag = false
//        }
    }
    
    @objc func longTouch() {
        print(flag)
        if !flag {
            
            flag = true
            timer = Timer(timeInterval: 0.1, repeats: true) { _ in
                UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations: {
                    self.testView.center.y += 10
                }, completion: nil)
            }
        }
        
//        timer.fire()
//        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { _ in
//            UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations: {
//                self.testView.center.y += 10
//            }, completion: nil)
//        }
//        timer.invalidate()
        RunLoop.current.add(timer, forMode: .default)
    }
    
    @objc func cancelTouch() {
        if let test = timer {
            test.invalidate()
            flag = false
        }
        print("touchupinside")
        
    }
}

