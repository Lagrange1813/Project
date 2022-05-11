//
//  TestView.swift
//  TextViewDOUBLE-Test
//
//  Created by 张维熙 on 2022/1/28.
//

import SnapKit
import UIKit

class PureTextView: UIScrollView, UITextViewDelegate {
    var title: String?
    var body: String?
    
    var titleFont: UIFont!
    var bodyFont: UIFont!
    
    var titleView: CustomTextView!
    var bodyView: CustomTextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTextView()
        customize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureTextView()
        customize()
    }
    
    func configureTextView() {
        titleView = CustomTextView()
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
        
        bodyView = CustomTextView()
        bodyView.backgroundColor = .systemGray
        bodyView.isScrollEnabled = false
        bodyView.sizeToFit()
        addSubview(bodyView)
        
        bodyView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo(300)
        }
    }
    
    private func configureFont(fontName: String, size: CGFloat) {
        titleFont = UIFont(name: fontName, size: size)
        bodyFont = UIFont(name: fontName, size: size)
    }
    
    private func customize() {
        self.backgroundColor = .white
        self.indicatorStyle = .black
        
        let titleFont = UIFont.systemFont(ofSize: 20)
        let titleColor = ColorCollection.lightTitleText
        
        let titleParagraphStyle: NSMutableParagraphStyle = {
            let style = NSMutableParagraphStyle()
            style.paragraphSpacing = 20
            style.alignment = .center
            return style
        }()
        
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: titleFont,
            .foregroundColor: titleColor,
            .paragraphStyle: titleParagraphStyle
        ]
        
        titleView.typingAttributes = titleAttributes
        let titleString = NSMutableAttributedString(string: title ?? "请输入标题", attributes: titleAttributes)
        titleView.attributedText = titleString
        
        let bodyFont = UIFont.systemFont(ofSize: 15)
        let bodyColor = ColorCollection.lightBodyText
        
        let bodyParagraphStyle: NSMutableParagraphStyle = {
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 7
            style.paragraphSpacing = 14
            style.firstLineHeadIndent = 2 * bodyFont.pointSize
            style.alignment = .justified
            return style
        }()
        
        let bodyAttributes: [NSAttributedString.Key: Any] = [
            .font: bodyFont,
            .foregroundColor: bodyColor,
            .paragraphStyle: bodyParagraphStyle
//            .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle
        ]
        
        bodyView.typingAttributes = bodyAttributes
        let bodyString = NSMutableAttributedString(string: body ?? "请输入正文", attributes: bodyAttributes)
        bodyView.attributedText = bodyString
    }
    
    
    func configureText(title: String, body: String) {
        self.title = title
        self.body = body
        self.customize()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        titleView.sizeToFit()
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
