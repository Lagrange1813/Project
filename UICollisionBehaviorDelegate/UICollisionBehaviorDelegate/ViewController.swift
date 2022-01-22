//
//  ViewController.swift
//  UICollisionBehaviorDelegate
//
//  Created by 张维熙 on 2021/12/9.
//

import UIKit

class ViewController: UIViewController {
    private var dynamicAnimator: UIDynamicAnimator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.initPhysics()
    }

    fileprivate var initalized = false
    fileprivate func initPhysics() {
        if self.initalized {
            return
        }
        self.initalized = true

        let physicsView = UIView(frame: view.bounds.insetBy(dx: 40, dy: 40))
        physicsView.backgroundColor = UIColor.black

        self.dynamicAnimator = UIDynamicAnimator(referenceView: physicsView)

        physicsView.isUserInteractionEnabled = false
        view.addSubview(physicsView)

        // Create ball
        let frame = CGRect(x: 0, y: 0, width: 40, height: 40)

        let rect = UIView(frame: frame)
        rect.backgroundColor = UIColor.red
        physicsView.addSubview(rect)

        let behavior = UIDynamicItemBehavior(items: [rect])
        behavior.elasticity = 1.0
        behavior.resistance = 0.0
        behavior.friction = 0.0
        behavior.allowsRotation = false
        self.dynamicAnimator?.addBehavior(behavior)

        // collision behavior setup
        let collisionBehavior = UICollisionBehavior(items: [rect])
        collisionBehavior.collisionDelegate = self
        collisionBehavior.setTranslatesReferenceBoundsIntoBoundary(with: .zero)
        collisionBehavior.collisionMode = .everything
        self.dynamicAnimator?.addBehavior(collisionBehavior)

        // Push ball
        let pushBehavior = UIPushBehavior(items: [rect], mode: UIPushBehavior.Mode.instantaneous)
        pushBehavior.active = true
        pushBehavior.pushDirection = CGVector(dx: 0.5, dy: 0.5)
        self.dynamicAnimator?.addBehavior(pushBehavior)
    }
}

extension ViewController: UICollisionBehaviorDelegate {
    // DELEGATE METHODS NOT CALLED
    func collisionBehavior(_ behavior: UICollisionBehavior,
                           beganContactFor item: UIDynamicItem,
                           withBoundaryIdentifier identifier: NSCopying?,
                           at p: CGPoint)
    {
        print("began contact boundary")
    }

    func collisionBehavior(_ behavior: UICollisionBehavior,
                           endedContactFor item: UIDynamicItem,
                           withBoundaryIdentifier identifier: NSCopying?)
    {
        print("contact boundary ended")
    }

    func collisionBehavior(_ behavior: UICollisionBehavior,
                           endedContactFor item1: UIDynamicItem,
                           with item2: UIDynamicItem)
    {
        print("contact item ended")
    }

    func collisionBehavior(_ behavior: UICollisionBehavior,
                           beganContactFor item1: UIDynamicItem,
                           with item2: UIDynamicItem,
                           at p: CGPoint)
    {
        print("began contact item")
    }
}
