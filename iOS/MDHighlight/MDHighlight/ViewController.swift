//
//  ViewController.swift
//  MDHighlight
//
//  Created by 张维熙 on 2022/5/3.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        let test = TestTextView()
        view.addSubview(test)
        
        test.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        test.layoutIfNeeded()
        test.identificateView.sizeToFit()
        test.contentSize = CGSize(width: 300, height: 3000)
        test.sizeToFit()
    }


}

