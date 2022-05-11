//
//  SelectionRect.swift
//  Notepad
//
//  Created by 张维熙 on 2022/3/27.
//

import UIKit

class CustomTextSelectionRect: UITextSelectionRect {
  override public var rect: CGRect { _rect }
  override public var writingDirection: NSWritingDirection { _writingDirection }
  override public var containsStart: Bool { _containsStart }
  override public var containsEnd: Bool { _containsEnd }
  override public var isVertical: Bool { _isVertical }
  
  var _rect: CGRect
  private let _writingDirection: NSWritingDirection
  private let _containsStart: Bool
  private let _containsEnd: Bool
  private let _isVertical: Bool
  
  public init(
    rect: CGRect,
    writingDirection: NSWritingDirection,
    containsStart: Bool,
    containsEnd: Bool,
    isVertical: Bool
  ) {
    _rect = rect
    _writingDirection = writingDirection
    _containsStart = containsStart
    _containsEnd = containsEnd
    _isVertical = isVertical
  }
}
