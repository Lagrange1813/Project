//
//  ViewController.swift
//  BullsEye
//
//  Created by 张维熙 on 2022/1/21.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    var testButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        testButton.setTitle("test", for: .normal)
        testButton.setTitleColor(.systemBlue, for: .normal)
        testButton.setTitleColor(.systemGray, for: .highlighted)
        testButton.setImage(UIImage(systemName: "sun.min"), for: .normal)
        testButton.backgroundColor = .gray

        view.addSubview(testButton)

        testButton.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }

        testButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }

    @objc func showAlert() {}
}
