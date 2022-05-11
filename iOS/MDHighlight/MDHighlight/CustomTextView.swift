//
//  CustomTextView.swift
//  MDHighlight
//
//  Created by 张维熙 on 2022/5/3.
//

import UIKit

class CustomTextView: UITextView {
    var custom: Bool = true

    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        if custom {
            let rects = super.selectionRects(for: range).map {
                CustomTextSelectionRect(
                    rect: CGRect(x: $0.rect.origin.x,
                                 y: $0.rect.origin.y,
                                 width: $0.rect.width,
                                 height: $0.rect.height),
                    writingDirection: $0.writingDirection,
                    containsStart: $0.containsStart,
                    containsEnd: $0.containsEnd,
                    isVertical: $0.isVertical
                )
            }

            if rects.count == 3 {
                if abs(rects[rects.count - 3]._rect.origin.y - rects[rects.count - 2]._rect.origin.y) < 10 {
                    rects[rects.count - 3]._rect.size.height = max(rects[rects.count - 2]._rect.size.height,
                                                                   rects[rects.count - 3]._rect.size.height)
                    rects[rects.count - 3]._rect.origin.y = rects[rects.count - 2]._rect.origin.y
                } else if abs(rects[rects.count - 3]._rect.origin.y - rects[rects.count - 1]._rect.origin.y) < 10 {
                    rects[rects.count - 3]._rect.size.height = max(rects[rects.count - 1]._rect.size.height,
                                                                   rects[rects.count - 3]._rect.size.height)
                    rects[rects.count - 3]._rect.origin.y = rects[rects.count - 1]._rect.origin.y
                }
            }

            if rects.count >= 5 {
                rects[0]._rect.size.height = rects[rects.count - 2]._rect.size.height
                rects[0]._rect.origin.y = rects[rects.count - 2]._rect.origin.y

                if abs(rects[rects.count - 3]._rect.origin.y - rects[rects.count - 1]._rect.origin.y) < 10 {
                    rects[rects.count - 3]._rect.size.height = rects[rects.count - 1]._rect.size.height
                }
            }

            if rects.count == 4 {
                rects[rects.count - 3]._rect.size.height = max(rects[rects.count - 1]._rect.size.height,
                                                               rects[rects.count - 3]._rect.size.height)

                rects[0]._rect.size.height = max(rects[rects.count - 2]._rect.size.height,
                                                 rects[0]._rect.size.height)

                if abs(rects[0]._rect.origin.y - rects[rects.count - 2]._rect.origin.y) < 10 {
                    rects[0]._rect.origin.y = rects[rects.count - 2]._rect.origin.y
                }
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
