//
//  DataManager.swift
//  Notepad
//
//  Created by 张维熙 on 2022/3/15.
//

import UIKit
import RxSwift
import RxCocoa

private let sigleton = DataManager()

class DataManager {
  static var shared: DataManager {
    sigleton
  }
  
  var themeMode: Observable<Int> = NotificationCenter.default.rx
      .notification(NSNotification.Name("traitCollectionDidChange"), object: nil)
      .startWith(NSNotification(name: NSNotification.Name("traitCollectionDidChange"), object: nil) as Notification)
      .map { _ in
        var result: Int!
        if UITraitCollection.current.userInterfaceStyle == .light {
          result = 1
        } else if UITraitCollection.current.userInterfaceStyle == .dark {
          result = 2
        }
        return result
      }
  
  var theme = BehaviorRelay<Theme>(value: Theme.BuiltIn.Default.enable())
  var currentTheme: Observable<ThemeList>
  var highlight = BehaviorRelay<Highlight>(value: Highlight.BuiltIn.SimpleLight.enable())
  
  init() {
    currentTheme = Observable.combineLatest(themeMode, theme) {
      var result: ThemeList!
      if $0 == 1 {
        result = $1.main
      } else if $0 == 2 {
        result = $1.secondary
      }
      return result
    }
    
  }
  
}

//let overallTheme = BehaviorRelay<Theme> (value: Theme.BuiltIn.Default.enable())
