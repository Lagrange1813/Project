//
//  ButtonContorller.swift
//  BahamaAirLoginScreen
//
//  Created by 张维熙 on 2021/12/2.
//  Copyright © 2021 Razeware LLC. All rights reserved.
//

import UIKit

class ButtonContorller: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)

//        setImage(UIImage(named: "shuttle"), for: UIControl.State.normal)
        titleLabel?.textAlignment = NSTextAlignment.center
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium)
        setTitle("设置", for: UIControl.State.normal)
        setTitleColor(UIColor.black, for: UIControl.State.normal)

        let space = 10
        titleEdgeInsets = UIEdgeInsets(top: 0, left: CGFloat(space)/2.0, bottom: 0, right: -CGFloat(space)/2.0)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -CGFloat(space)/2.0, bottom: 0, right: CGFloat(space)/2.0)
        imageView?.contentMode = .scaleAspectFill

        sizeToFit()
    }

    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
