//
//  BaseTextView.swift
//  Notepad
//
//  Created by 张维熙 on 2022/2/24.
//

import UIKit

class BaseTextView: UIScrollView {
    var title: String?
    var body: String?

    var titleView: CustomTextView!
    var bodyView: CustomTextView!

    var theme: ThemeList!

    init(_ theme: ThemeList) {
        super.init(frame: CGRect())
        self.theme = theme
        configureTextView()
        customize()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureTextView() {
        configureTitleView()
        configureBodyView()
    }

    func configureTitleView() {}

    func configureBodyView() {
    }

    func configureText(title: String, body: String) {
        self.title = title
        self.body = body
        customize()
    }

    func customize() {
        titleView.typingAttributes = theme.titleAttributes
        let titleString = NSMutableAttributedString(string: title ?? "请输入标题", attributes: theme.titleAttributes)
        titleView.attributedText = titleString

        titleView.selectedRange = NSRange(location: 0, length: 0)
        
        bodyView.typingAttributes = theme.bodyAttributes
        let bodyString = NSMutableAttributedString(string: body ?? "请输入正文", attributes: theme.bodyAttributes)
        bodyView.attributedText = bodyString

        bodyView.selectedRange = NSRange(location: 0, length: 0)
    }

    func resize() {
        contentSize = CGSize(width: frame.width, height: titleView.frame.height + bodyView.frame.height)
    }

    func correctLayout(width: CGFloat) {}

    func setInsets(topPadding: CGFloat, bottomPadding: CGFloat) {
        contentInset = UIEdgeInsets(top: topPadding + titleBarOffset, left: 0, bottom: bottomPadding, right: 0)
    }
}
