//
//  TextViewCntrVM.swift
//  Notepad
//
//  Created by 张维熙 on 2022/3/27.
//

import UIKit
import RxSwift
import RxCocoa

class TextViewContainerViewModel {
  var textType: Observable<String?>
  
  init() {
    textType = UserDefaults.standard.rx
      .observe(String.self, "CurrentTextType")
  }
}
