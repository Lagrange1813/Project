//
//  ViewController.swift
//  ImageSelector
//
//  Created by 张维熙 on 2022/4/30.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    var manager: ImageManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutView()
    }

    func layoutView() {
        let imageView = UIImageView()
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalToSuperview()
        }
        
        let button = UIButton()
        button.setTitle("选择图片", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.setTitleColor(UIColor(red: 0.88, green: 0.93, blue: 1, alpha: 1), for: .highlighted)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(300)
        }
        
        manager = ImageManager(viewController: self, delegate: self)
        
        button.addTarget(self, action: #selector(transfer), for: .touchUpInside)
    }
    
    @objc func transfer() {
        manager.showAction()
    }
}

extension ViewController: ImageManagerDelegate {
    func handle(with image: UIImage, with error: ImagePickingError) {
        print(image.size)
    }
}
