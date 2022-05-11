//
//  CustomWindow.swift
//  Notepad
//
//  Created by 张维熙 on 2022/3/27.
//

import UIKit

final class CustomWindow: UIWindow {
  private var userInterfaceStyle = UITraitCollection.current.userInterfaceStyle
  
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    let currentUserInterfaceStyle = UITraitCollection.current.userInterfaceStyle
    if currentUserInterfaceStyle != userInterfaceStyle {
      userInterfaceStyle = currentUserInterfaceStyle
      NotificationCenter.default.post(name: NSNotification.Name("traitCollectionDidChange"), object: self)
    }
  }
}
