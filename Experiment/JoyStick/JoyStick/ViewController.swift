//
//  ViewController.swift
//  JoyStick
//
//  Created by 张维熙 on 2021/12/13.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    let joystickSize: CGFloat = 50
    let substractSize: CGFloat = 100

    var innerRadius: CGFloat = 0.0

    let joystickSubstractView = UIView()
    let joystickView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        joystickSubstractView.backgroundColor = .gray
        joystickSubstractView.layer.cornerRadius = CGFloat(substractSize / 2)
        view.addSubview(joystickSubstractView)

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(dragJoystick(_:)))
        joystickView.isUserInteractionEnabled = true
        joystickView.addGestureRecognizer(panGesture)
        joystickView.backgroundColor = .yellow
        joystickView.layer.cornerRadius = CGFloat(joystickSize / 2)
        joystickSubstractView.addSubview(joystickView)

        joystickSubstractView.snp.makeConstraints {
            $0.width.height.equalTo(substractSize)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(150)
        }

        joystickView.snp.makeConstraints {
            $0.width.height.equalTo(joystickSize)
            $0.center.equalToSuperview()
        }

        // if you want the "joystick" circle to overlap the "outer circle" a bit, adjust this value
        innerRadius = (substractSize - joystickSize) * 0.5

        // start debugging / clarification...
        // add a center "dot" to the joystick view
        // add a red circle showing the inner radius - where we want to restrict the center of the joystick view
        let jsCenterView = UIView()
        jsCenterView.backgroundColor = .green
        jsCenterView.layer.cornerRadius = 2.0
        joystickView.addSubview(jsCenterView)
        jsCenterView.snp.makeConstraints {
            $0.width.height.equalTo(4.0)
            $0.center.equalToSuperview()
        }

        let v = UIView()
        v.backgroundColor = .clear
        v.layer.borderColor = UIColor.red.cgColor
        v.layer.borderWidth = 2
        v.layer.cornerRadius = innerRadius
        v.isUserInteractionEnabled = false
        joystickSubstractView.addSubview(v)
        v.snp.makeConstraints {
            $0.width.height.equalTo(innerRadius * 2.0)
            $0.center.equalToSuperview()
        }

        // end debugging / clarification
    }

    func lineLength(from pt1: CGPoint, to pt2: CGPoint) -> CGFloat {
        return hypot(pt2.x - pt1.x, pt2.y - pt1.y)
    }

    func pointOnLine(from startPt: CGPoint, to endPt: CGPoint, distance: CGFloat) -> CGPoint {
        let totalDistance = lineLength(from: startPt, to: endPt)
        let totalDelta = CGPoint(x: endPt.x - startPt.x, y: endPt.y - startPt.y)
        let pct = distance / totalDistance
        let delta = CGPoint(x: totalDelta.x * pct, y: totalDelta.y * pct)
        return CGPoint(x: startPt.x + delta.x, y: startPt.y + delta.y)
    }

    @objc func dragJoystick(_ sender: UIPanGestureRecognizer) {
        let touchLocation = sender.location(in: joystickSubstractView)

        let outerCircleViewCenter = CGPoint(x: joystickSubstractView.bounds.width * 0.5, y: joystickSubstractView.bounds.height * 0.5)

        var newCenter = touchLocation

        let distance = lineLength(from: touchLocation, to: outerCircleViewCenter)

        // if the touch would put the "joystick circle" outside the "outer circle"
        // find the point on the line from center to touch, at innerRadius distance
        if distance > innerRadius {
            newCenter = pointOnLine(from: outerCircleViewCenter, to: touchLocation, distance: innerRadius)
        }

        joystickView.center = newCenter
    }
}
