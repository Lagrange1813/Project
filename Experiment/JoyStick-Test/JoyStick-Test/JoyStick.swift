//
//  JoyStick.swift
//  JoyStick-Test
//
//  Created by 张维熙 on 2021/12/16.
//

import SnapKit
import UIKit

class JoyStick: UIView {
    private var innerCornerRadius: Double!
    private var stickView: UIView!
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(dragStick))

    init() {
        let cornerRadius = 50.0
        super.init(frame: CGRect(x: 0,
                                 y: 0,
                                 width: cornerRadius * 2.0,
                                 height: cornerRadius * 2.0))
        super.backgroundColor = .gray
        super.layer.cornerRadius = cornerRadius
        self.innerCornerRadius = cornerRadius
        configureStick()
    }

    init(x: Double, y: Double, cornerRadius: Double) {
        super.init(frame: CGRect(x: x,
                                 y: y,
                                 width: cornerRadius * 2.0,
                                 height: cornerRadius * 2.0))
        super.backgroundColor = .gray
        super.layer.cornerRadius = cornerRadius
        self.innerCornerRadius = cornerRadius
        configureStick()
    }

    init(center: CGPoint, cornerRadius: Double) {
        super.init(frame: CGRect(x: center.x, y: center.y, width: cornerRadius * 2.0, height: cornerRadius * 2.0))
        super.backgroundColor = .gray
        super.layer.cornerRadius = cornerRadius
        self.innerCornerRadius = cornerRadius
        configureStick()
    }

    private func configureStick() {
        stickView = UIView(frame: CGRect(x: innerCornerRadius/2.0,
                                         y: innerCornerRadius/2.0,
                                         width: innerCornerRadius,
                                         height: innerCornerRadius))
        stickView.backgroundColor = .white
        stickView.layer.cornerRadius = innerCornerRadius/2.0
        super.addSubview(stickView)
        stickView.addGestureRecognizer(panGesture)
        stickView.isUserInteractionEnabled = true
        test()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func lineLength(from pt1: CGPoint, to pt2: CGPoint) -> CGFloat {
        return hypot(pt2.x - pt1.x, pt2.y - pt1.y)
    }

    func pointOnLine(from startPt: CGPoint, to endPt: CGPoint, distance: CGFloat) -> CGPoint {
        let totalDistance = lineLength(from: startPt, to: endPt)
        let totalDelta = CGPoint(x: endPt.x - startPt.x, y: endPt.y - startPt.y)
        let pct = distance/totalDistance
        let delta = CGPoint(x: totalDelta.x * pct, y: totalDelta.y * pct)
        return CGPoint(x: startPt.x + delta.x, y: startPt.y + delta.y)
    }

    @objc func dragStick(_ sender: UIPanGestureRecognizer) {
        let touchLocation = sender.location(in: stickView)

        let outerCircleViewCenter = CGPoint(x: super.bounds.width * 0.5, y: super.bounds.height * 0.5)

        var newCenter = touchLocation

        let distance = lineLength(from: touchLocation, to: outerCircleViewCenter)

        if distance > innerCornerRadius/2.0 {
            newCenter = pointOnLine(from: outerCircleViewCenter, to: touchLocation, distance: innerCornerRadius/2.0)
        }

        stickView.center = newCenter
    }

    func test() {
        let jsCenterView = UIView()
        jsCenterView.backgroundColor = .green
        jsCenterView.layer.cornerRadius = 2.0
        stickView.addSubview(jsCenterView)
        jsCenterView.snp.makeConstraints {
            $0.width.height.equalTo(4.0)
            $0.center.equalToSuperview()
        }

        let v = UIView()
        v.backgroundColor = .clear
        v.layer.borderColor = UIColor.red.cgColor
        v.layer.borderWidth = 2
        v.layer.cornerRadius = innerCornerRadius/2.0
        v.isUserInteractionEnabled = false
        super.addSubview(v)
        v.snp.makeConstraints {
            $0.width.height.equalTo(innerCornerRadius)
            $0.center.equalToSuperview()
        }
    }
}
