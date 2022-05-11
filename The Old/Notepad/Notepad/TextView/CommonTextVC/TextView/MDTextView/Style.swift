//
//  Style.swift
//  Notepad
//
//  Created by 张维熙 on 2022/2/25.
//

import UIKit

public struct Style {
    var regex: NSRegularExpression!
    public var attributes: [NSAttributedString.Key: Any] = [:]

    public init(regex: NSRegularExpression, attributes: [NSAttributedString.Key: Any]) {
        self.regex = regex
        self.attributes = attributes
    }

    public init(item: Item, attributes: [NSAttributedString.Key: Any]) {
        self.regex = item.toRegex()
        self.attributes = attributes
    }

    public init() {
        self.regex = Item.unknown.toRegex()
    }
}
