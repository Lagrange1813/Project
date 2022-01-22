//
//  ViewController.swift
//  UIKit-Dynamics-Demo
//
//  Created by 张维熙 on 2021/12/8.
//

import UIKit

class ViewController: UIViewController {
    var collision: UICollisionBehavior!
    var animtor: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var push: UIPushBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.gray
        view.addSubview(square)
        
//        let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 20))
//        barrier.backgroundColor = UIColor.red
//        view.addSubview(barrier)
        
        animtor = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animtor.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [square])
//        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: barrier.frame))
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.collisionMode = .everything
        animtor.addBehavior(collision)
        
        push = UIPushBehavior(items: [square], mode: .instantaneous)
        push.pushDirection = CGVector(dx: 0, dy: 1)
        push.setAngle(0, magnitude: 15)
        animtor.addBehavior(push)
        
        
        
        let btn1 = UIButton(frame: CGRect(x: 300, y: 100, width: 20, height: 20))
        btn1.setTitle("Test", for: .normal)
        btn1.setImage(UIImage(systemName: "plus.square.on.square"), for: .normal)
        view.addSubview(btn1)
        btn1.addTarget(self, action: #selector(test), for: .touchUpInside)
//        collision.action = {
//            print("\(NSCoder.string(for: square.transform)) \(NSCoder.string(for: square.center))")
//            }
        
//        UIView.animate(withDuration: 1, delay: 0.0, options: [], animations: {
//            square.center.y -= 1000
//        }, completion: nil)
        
        collision.collisionDelegate = self
        
        
        
        let itemBehaviour = UIDynamicItemBehavior(items: [square])
        itemBehaviour.elasticity = 0.6
        animtor.addBehavior(itemBehaviour)
        
        func addPosition()  {
            var updateCount = 0
            collision.action = {
                if updateCount % 3 == 0 {
                    let outLine = UIView(frame: square.bounds)
                    outLine.transform = square.transform
                    outLine.center = square.center
                    
                    outLine.alpha = 0.5
                    outLine.backgroundColor = .clear
                    outLine.layer.borderColor = square.layer.presentation()?.backgroundColor
                    outLine.layer.borderWidth = 1.0
                    self.view.addSubview(outLine)
                }
                updateCount += 1
            }
        }
        
        addPosition()
    }
    
    @objc func test() {
        let square1 = UIView(frame: CGRect(x: 100, y: 400, width: 100, height: 100))
        square1.backgroundColor = UIColor.gray
        view.addSubview(square1)
        let attachGravity = UIGravityBehavior(items: [square1])
        collision.addItem(square1)
        animtor.addBehavior(attachGravity)
    }
}

extension ViewController: UICollisionBehaviorDelegate {
    func collisionBehavior(_: UICollisionBehavior, beganContactFor: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at: CGPoint) {
        print("Boundary contact occurred - \(String(describing: identifier))")
    }
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        print("It occurred!")
    }
}
