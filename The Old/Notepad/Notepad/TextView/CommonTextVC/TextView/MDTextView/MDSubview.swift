//
//  MDSubview.swift
//  Notepad
//
//  Created by 张维熙 on 2022/2/25.
//

import UIKit

class MDSubview: CustomTextView {
    var substitute = false
    override var custom: Bool {
        get {
            return substitute
        }
        set {
            substitute = newValue
        }
    }
    var storage: CustomTextStorage = CustomTextStorage()
    var highlight: Highlight? {
        didSet {
            storage.highlight = highlight
        }
    }
    
    init() {
        let layoutManager = NSLayoutManager()
        let containerSize = CGSize(width: 0, height: CGFloat.greatestFiniteMagnitude)
        let container = NSTextContainer(size: containerSize)
        container.widthTracksTextView = true

        layoutManager.addTextContainer(container)
        storage.addLayoutManager(layoutManager)
        super.init(frame: CGRect(), textContainer: container)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
