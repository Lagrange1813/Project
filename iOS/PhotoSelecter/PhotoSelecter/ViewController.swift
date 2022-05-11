//
//  ViewController.swift
//  PhotoSelecter
//
//  Created by 张维熙 on 2022/4/30.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        
        button.addTarget(self, action: #selector(fetchImage), for: .touchUpInside)
    }
    
    @objc func fetchImage() {
        let alert = UIAlertController(title: "选择图片", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "拍照", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "从手机相册选择", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel))
        present(alert, animated: true)
    }
    
    

}

