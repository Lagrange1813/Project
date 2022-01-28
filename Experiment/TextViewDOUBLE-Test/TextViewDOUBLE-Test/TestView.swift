//
//  TestView.swift
//  TextViewDOUBLE-Test
//
//  Created by 张维熙 on 2022/1/28.
//

import SnapKit
import UIKit

class PureTestView: UIScrollView, UITextViewDelegate {
    var title: String?
    var body: String?
    
    var titleView: UITextView!
    var bodyView: UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customize()
    }
    
    private func customize() {
        titleView = UITextView()
        titleView.font = UIFont.systemFont(ofSize: 20)
        titleView.backgroundColor = .systemBlue
        titleView.isScrollEnabled = false
        titleView.textAlignment = .center
        titleView.delegate = self
        titleView.sizeToFit()
        addSubview(titleView)
        
        titleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(200)
        }
        
        bodyView = UITextView()
        bodyView.font = UIFont.systemFont(ofSize: 15)
        bodyView.backgroundColor = .systemGray
        bodyView.isScrollEnabled = false
        
        addSubview(bodyView)
        
        bodyView.sizeToFit()
        
        bodyView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom)
            make.leading.equalToSuperview()
//            make.height.equalTo(10000)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        contentSize = CGSize(width: self.frame.width, height: titleView.frame.height + 10000)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        titleView.sizeToFit()
        print(titleView.frame.height)
        print(bodyView.frame.height)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            bodyView.becomeFirstResponder()
            return false
        }
        return true
    }
    
    func resize() {
        contentSize = CGSize(width: frame.width, height: titleView.frame.height + bodyView.frame.height)
    }
}
