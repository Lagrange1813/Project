//
//  ViewController.swift
//  Spaceship
//
//  Created by 张维熙 on 2021/11/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackground()
        configureShip()
        configureHostileShip()
    }
    
    func configureBackground() {
        view.backgroundColor = .black
    }
    
    func configureShip() {
        let ship = SpaceShip(frame: CGRect())
        view.addSubview(ship)
        makeConstraintsOfShip(ship: ship)
    }
    
    func makeConstraintsOfShip(ship: SpaceShip) {
        ship.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-80)
        }
    } 

    func configureHostileShip() {
        let hostileShip = UIView(frame: CGRect())
        hostileShip.backgroundColor = .systemBlue
        self.view.addSubview(hostileShip)
        makeConstraintsOfHostileShip(hostileShip: hostileShip)
    }
     
    func makeConstraintsOfHostileShip(hostileShip: UIView) {
        hostileShip.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.centerX.equalToSuperview()
            make.centerY.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
        }
    }
}

