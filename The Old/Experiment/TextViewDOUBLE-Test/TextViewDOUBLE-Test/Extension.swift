//
//  Extension.swift
//  TextViewDOUBLE-Test
//
//  Created by 张维熙 on 2022/1/28.
//

import Foundation
import UIKit

struct ColorCollection {
    static let lightBodyBG = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    static let lightTitleText = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    static let lightBodyText = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    static let lightNavigation = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    static let lightCountBG = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    static let lightToolBG = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    static let lightRightBG = UIColor(red: 0.94117, green: 0.94117, blue: 0.94117, alpha: 1)
    
    static let darkBodyBG = UIColor(red: 0.15686, green: 0.15686, blue: 0.15686, alpha: 1)
    static let darkBodyText = UIColor(red: 0.90196, green: 0.90196, blue: 0.90196, alpha: 1)
    static let darkNavigation = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    static let darkCountBG = UIColor(red: 0.13333, green: 0.13333, blue: 0.13333, alpha: 0.6)
}

enum ScreenSize {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height

    static let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
    static let topPadding = window?.safeAreaInsets.top
    static let bottomPadding = window?.safeAreaInsets.bottom
//    static let bottomPadding = { () -> CGFloat? in
//        if (window?.safeAreaInsets.bottom)! > 0 {
//            return window?.safeAreaInsets.bottom
//        } else {
//            return 20.0
//        }
//    }
}
