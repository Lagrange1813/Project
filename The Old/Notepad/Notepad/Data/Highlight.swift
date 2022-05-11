//
//  Highlights.swift
//  Notepad
//
//  Created by 张维熙 on 2022/2/25.
//

import UIKit

public struct Highlight {
  public enum BuiltIn: String {
    case SimpleLight = "simple-light"
    case SimpleDark = "simple-dark"
    
    public func enable() -> Highlight {
      Highlight(rawValue)
    }
  }
  
  public var body: Style = .init()
  public var styles: [Style] = []
  
  init(_ name: String) {
    let bundle = Bundle.main
    let path: String!
    
    if let path1 = bundle.path(forResource: "highlights/\(name)", ofType: "json") { path = path1 }
    else if let path2 = bundle.path(forResource: name, ofType: "json") { path = path2 }
    else {
      print("Unable to load your theme file.")
      assertionFailure()
      return
    }
    
    if let data = convertFile(path) {
      configure(data)
    }
  }
  
  func convertFile(_ path: String) -> [String: AnyObject]? {
    do {
      let json = try String(contentsOf: URL(fileURLWithPath: path), encoding: .utf8)
      if let data = json.data(using: .utf8) {
        do {
          return try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
        } catch let error as NSError {
          print(error)
        }
      }
    } catch let error as NSError {
      print(error)
    }
    
    return nil
  }
  
  mutating func configure(_ data: [String: AnyObject]) {
    if var allStyles = data["styles"] as? [String: AnyObject] {
      if let bodyStyle = allStyles["body"] as? [String: AnyObject] {
        if let bodyAttributes = parse(bodyStyle) {
          body = Style(item: .body, attributes: bodyAttributes)
        }
      }
      
      allStyles.removeValue(forKey: "body")
      
      for (item, attributes) in allStyles {
        if let parsedStyles = parse(attributes as! [String: AnyObject]) {
          if let regexString = attributes["regex"] as? String {
            let regex = regexString.toRegex()
            styles.append(Style(regex: regex, attributes: parsedStyles))
          } else {
            styles.append(Style(item: Item.unknown.from(string: item), attributes: parsedStyles))
          }
        }
      }
    }
  }
  
  func parse(_ attributes: [String: AnyObject]) -> [NSAttributedString.Key: Any]? {
    var stringAttributes: [NSAttributedString.Key: Any] = [:]
    
    if let color = attributes["color"] as? String {
      stringAttributes[NSAttributedString.Key.foregroundColor] = UIColor(hexString: color)
    }
    
    let fontSize: CGFloat = attributes["size"] as? CGFloat ?? 15
    let fontName: String = attributes["font"] as? String ?? "LXGW WenKai"
    
    let font = UIFont(name: fontName, size: fontSize)
    
    stringAttributes[NSAttributedString.Key.font] = font
    
    return stringAttributes
  }
}
