//
//  MDTextView.swift
//  Notepad
//
//  Created by 张维熙 on 2022/2/24.
//

import UIKit

class MDTextView: BaseTextView {
    var mdSubview = MDSubview()
    
    override var bodyView: CustomTextView! {
        get {
            return mdSubview
        }
        set {
            self.mdSubview = (newValue as! MDSubview)
        }
    }
    
    override func configureTitleView() {
        titleView = CustomTextView()
        titleView.isScrollEnabled = false
        titleView.backgroundColor = .clear
        titleView.sizeToFit()
        addSubview(titleView)

        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(0)
        }
    }
    
    override func configureBodyView() {
        if !theme.frostedGlass {
            guard let highlight = theme.highlight else { return }
            mdSubview.highlight = highlight
        }
        
        bodyView.isScrollEnabled = false
        bodyView.backgroundColor = .clear
        addSubview(bodyView)

        bodyView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(0)
        }
    }
    
    override func correctLayout(width: CGFloat) {
        titleView.snp.updateConstraints { make in
            make.width.equalTo(width - 30)
        }
        bodyView.snp.updateConstraints { make in
            make.width.equalTo(width - 10)
        }
    }
}
