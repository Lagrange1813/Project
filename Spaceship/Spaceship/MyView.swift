//
//  MyView.swift
//  Spaceship
//
//  Created by 张维熙 on 2021/11/24.
//

import UIKit

class MyView: UIView {

    var lastLocation = CGPoint(x: 0, y: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            
        // 初始化代码
        let panRecognizer = UIPanGestureRecognizer(target:self, action:#selector(MyView.detectPan(_:)))
        self.gestureRecognizers = [panRecognizer]
            
        // 视图的颜色随机显示
        let blueValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let greenValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let redValue = CGFloat(Int(arc4random() % 255)) / 255.0
            
        self.backgroundColor = UIColor(red:redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func detectPan(_ recognizer:UIPanGestureRecognizer) {
        let translation  = recognizer.translation(in: self.superview)
        self.center = CGPoint(x: lastLocation.x + translation.x, y: lastLocation.y + translation.y)
    }

    override func touchesBegan(_ touches: (Set<UITouch>?), with event: UIEvent!) {
        // 把当前被选中的视图放到前面
        self.superview?.bringSubviewToFront(self)
          
        // 记住原来的位置
        lastLocation = self.center
    }
}
