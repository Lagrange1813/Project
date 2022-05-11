//
//  CustomTextStorage.swift
//  Notepad
//
//  Created by 张维熙 on 2022/2/25.
//

import UIKit

class CustomTextStorage: NSTextStorage {
  public var highlight: Highlight? {
    didSet {
      let wholeRange = NSRange(location: 0, length: (self.string as NSString).length)
      
      self.beginEditing()
      self.applyStyles(wholeRange)
      self.edited(.editedAttributes, range: wholeRange, changeInLength: 0)
      self.endEditing()
    }
  }
  
  //    let testRegex = "^(\\#{3}(.*))$"
  
  var backingStore = NSTextStorage()
  
  override public var string: String {
    get {
      return backingStore.string
    }
  }
  
  override public init() {
    super.init()
  }
  
  override public init(attributedString attrStr: NSAttributedString) {
    super.init(attributedString:attrStr)
    backingStore.setAttributedString(attrStr)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  required public init(itemProviderData data: Data, typeIdentifier: String) throws {
    fatalError("init(itemProviderData:typeIdentifier:) has not been implemented")
  }
  
  override public func attributes(at location: Int, longestEffectiveRange range: NSRangePointer?, in rangeLimit: NSRange) -> [NSAttributedString.Key : Any] {
    return backingStore.attributes(at: location, longestEffectiveRange: range, in: rangeLimit)
  }
  
  public override func attributes(at location: Int, effectiveRange range: NSRangePointer?) -> [NSAttributedString.Key : Any] {
    return backingStore.attributes(at: location, effectiveRange: range)
  }
  
  override public func replaceCharacters(in range: NSRange, with str: String) {
    self.beginEditing()
    backingStore.replaceCharacters(in: range, with: str)
    let len = (str as NSString).length
    let change = len - range.length
    self.edited([.editedCharacters, .editedAttributes], range: range, changeInLength: change)
    self.endEditing()
  }
  
  public override func setAttributes(_ attrs: [NSAttributedString.Key : Any]?, range: NSRange) {
    self.beginEditing()
    backingStore.setAttributes(attrs, range: range)
    self.edited(.editedAttributes, range: range, changeInLength: 0)
    self.endEditing()
  }
  
  override public func processEditing() {
    let backingString = backingStore.string
    if let nsRange = backingString.range(from: NSMakeRange(NSMaxRange(editedRange), 0)) {
      let indexRange = backingString.lineRange(for: nsRange)
      let extendedRange: NSRange = NSUnionRange(editedRange, backingString.nsRange(from: indexRange))
      applyStyles(extendedRange)
    }
    super.processEditing()
  }
  
  func applyStyles(_ range: NSRange) {
    guard let highlight = highlight else { return }
    
    let backingString = backingStore.string
    backingStore.setAttributes(highlight.body.attributes, range: range)
    
    for (style) in highlight.styles {
      style.regex.enumerateMatches(in: backingString, options: .withoutAnchoringBounds, range: range, using: { (match, flags, stop) in
        guard let match = match else { return }
        backingStore.addAttributes(style.attributes, range: match.range(at: 0))
      })
    }
  }
}
