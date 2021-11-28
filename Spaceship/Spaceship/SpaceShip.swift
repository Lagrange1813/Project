//
//  SpaceShip.swift
//  Spaceship
//
//  Created by 张维熙 on 2021/11/24.
//

import UIKit

class SpaceShip: UIImageView {

    var lastLocation = CGPoint(x: 0, y: 0)
    
    override init(frame: CGRect) {
//        super.init(frame: frame)
        super.init(image: UIImage(named: "shuttle"))
        let panRecognizer = UIPanGestureRecognizer(target:self, action:#selector(SpaceShip.detectPan(_:)))
        self.gestureRecognizers = [panRecognizer]
        self.isUserInteractionEnabled = true
//        self.image = UIImage(named: "shuttle")
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func detectPan(_ recognizer:UIPanGestureRecognizer) {
        let translation  = recognizer.translation(in: self.superview)
        self.center = CGPoint(x: lastLocation.x + translation.x, y: lastLocation.y + translation.y)
    }

    
    override func touchesBegan(_ touches: (Set<UITouch>?), with event: UIEvent!) {
        self.superview?.bringSubviewToFront(self)
        lastLocation = self.center
    }
}
