//
//  CustomTextView.swift
//  Notepad
//
//  Created by 张维熙 on 2022/3/27.
//

import UIKit

class CustomTextView: UITextView {
  var custom: Bool = true
  
  var height: CGFloat {
    let positon = self.position(from: self.beginningOfDocument, offset: 0)!
    let range = self.textRange(from: positon, to: positon)!
    var height = firstRect(for: range).height
    
    if isFullScreen() {
      height += 2
    } else { height += 1 }
    
    return height
  }
  
  var offset: CGFloat {
    (height - font!.lineHeight) / 2
  }
  
  override func caretRect(for position: UITextPosition) -> CGRect {
    var originalRect = super.caretRect(for: position)
    
    if custom {
      originalRect.size.height = font!.lineHeight + 2
      originalRect.size.width = 2
    }
    
    return originalRect
  }
  
  override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
    if custom {
      let rects = super.selectionRects(for: range).map {
        CustomTextSelectionRect(
          rect: CGRect(x: $0.rect.origin.x,
                       y: $0.rect.origin.y - offset,
                       width: $0.rect.width,
                       height: $0.rect.height),
          writingDirection: $0.writingDirection,
          containsStart: $0.containsStart,
          containsEnd: $0.containsEnd,
          isVertical: $0.isVertical
        )
      }
      
      if rects.count >= 3 {
        rects[rects.count - 3]._rect.size.height = height
        rects[rects.count - 2]._rect.size.height = max(firstRect(for: range).height, height)
        rects[rects.count - 1]._rect.size.height = height
      }
      
      return rects
    }
    return super.selectionRects(for: range)
  }
  
  public func fetchRect(_ textView: CustomTextView, _ range: NSRange) -> CGRect {
    let beginning = textView.beginningOfDocument
    let position = textView.position(from: beginning, offset: range.location)!
    return textView.caretRect(for: position)
  }
}
