//
//  MDHighlightView.swift
//  MDHighlight
//
//  Created by 张维熙 on 2022/5/3.
//

import UIKit

class MDHighlightView: UITextView {
    
    init(frame: CGRect) {
        super.init(frame: frame, textContainer: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
