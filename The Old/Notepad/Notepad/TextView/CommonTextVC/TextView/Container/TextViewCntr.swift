//
//  TextViewCntr.swift
//  Notepad
//
//  Created by 张维熙 on 2022/3/27.
//

import UIKit
import RxSwift
import RxCocoa

class TextViewContainer: UIView {
  var textView: BaseTextView!
  var viewModel: TextViewContainerViewModel!
  var theme = Theme.BuiltIn.Default.enable()
  
  init(
    bag: DisposeBag
  ) {
    super.init(frame: CGRect())
    viewModel = TextViewContainerViewModel()
    
    viewModel.textType
      .subscribe(onNext: {
        if $0 == "Text" {
          self.layout(with: PureTextView(self.theme.main))
        } else if $0 == "MD" {
          self.layout(with: MDTextView(self.theme.main))
        }
      })
      .disposed(by: bag)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func layout(with view: BaseTextView) {
    if textView != nil {
      textView.removeFromSuperview()
      textView = nil
    }
    
    textView = view
    
    insertSubview(view, at: 0)
    
    view.snp.makeConstraints { make in
      make.top.bottom.left.right.equalToSuperview()
    }
  }
}
