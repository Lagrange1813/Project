//
//  CustomButton.swift
//  Notepad
//
//  Created by 张维熙 on 2022/3/27.
//

import UIKit

class CustomButton: UIButton {
  var identifier: String?
  var argument: String?
  var retreat: Int?
  
  override var isHighlighted: Bool {
    didSet {
      if isHighlighted {
        self.tintColor = .white
      } else {
        self.tintColor = .black
      }
    }
  }
}
