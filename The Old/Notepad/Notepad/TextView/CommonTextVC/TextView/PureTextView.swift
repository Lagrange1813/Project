//
//  PureTextView.swift
//  Notepad
//
//  Created by 张维熙 on 2022/1/24.
//

import UIKit

class PureTextView: BaseTextView {
    override func configureTitleView() {
        titleView = CustomTextView()
        titleView.isScrollEnabled = false
        titleView.backgroundColor = .clear
        titleView.sizeToFit()
        addSubview(titleView)
//      insertSubview(titleView, at: 0)

        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
        }
    }
    
    override func configureBodyView() {
        bodyView = CustomTextView()
        bodyView.isScrollEnabled = false
        bodyView.backgroundColor = .clear
        addSubview(bodyView)
//      insertSubview(bodyView, at: 0)

        bodyView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(0)
        }
    }
    
    override func correctLayout(width: CGFloat) {
        bodyView.snp.updateConstraints { make in
            make.width.equalTo(width - 10)
        }
    }
}
