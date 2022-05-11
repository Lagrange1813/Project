//
//  CustomScrollView.swift
//  Notepad
//
//  Created by 张维熙 on 2022/3/27.
//

import UIKit

class CustomScrollView: UIScrollView {
  override func touchesShouldCancel(in view: UIView) -> Bool {
    if view.isKind(of: UIButton.self) { return true }
    return super.touchesShouldCancel(in: view)
  }
}
