//
//  Extensions.swift
//  Notepad
//
//  Created by 张维熙 on 2022/1/23.
//

import CoreData
import Foundation
import RxCocoa
import RxSwift
import UIKit

extension UIColor {
  convenience init(hexString: String) {
    let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int = UInt64()
    Scanner(string: hex).scanHexInt64(&int)
    let a, r, g, b: UInt64
    switch hex.count {
      case 3: // RGB (12-bit)
        (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
      case 6: // RGB (24-bit)
        (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
      case 8: // ARGB (32-bit)
        (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
      default:
        (a, r, g, b) = (255, 0, 0, 0)
    }
    self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
  }
}

func isFullScreen() -> Bool {
  if ScreenSize.bottomPadding! > 0 { return true }
  else { return false }
}

enum ColorCollection {
  static let lightBodyBG = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

  static let lightTitleText = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
  static let lightBodyText = UIColor(red: 0, green: 0, blue: 0, alpha: 1)

  static let lightTitleBar = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

  static let lightCountBG = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
  static let lightToolBG = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

  static let lightRightBG = UIColor(red: 0.94117, green: 0.94117, blue: 0.94117, alpha: 1)

  static let darkBodyBG = UIColor(red: 0.15686, green: 0.15686, blue: 0.15686, alpha: 1)
  static let darkBodyText = UIColor(red: 0.90196, green: 0.90196, blue: 0.90196, alpha: 1)
  static let darkNavigation = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
  static let darkCountBG = UIColor(red: 0.13333, green: 0.13333, blue: 0.13333, alpha: 0.6)
}

enum FontCollection {
  static let titleFont = UIFont(name: "LXGW WenKai", size: 0)
}

enum Font {
  case bookTitle
  case articleTitle
  case articleBody
}

// func fetchFont(font: Font) -> UIFont {
//    switch font {
//    case .bookTitle:
//        return UIFont(name: "LXGW WenKai Bold", size: 16)!
//    case .articleTitle:
//        return UIFont(name: "LXGW WenKai Bold", size: 15)!
//    case .articleBody:
//        return UIFont(name: "LXGW WenKai", size: 13)!
//    }
// }

/// 若 topPadding 大于 20， 返回 0 ，否则返回 10
let titleBarOffset: CGFloat = {
  if ScreenSize.topPadding! > 20 {
    return 0
  } else {
    return 10
  }
}()

enum ScreenSize {
  static let width = UIScreen.main.bounds.width
  static let height = UIScreen.main.bounds.height

  static let window = UIApplication.shared.windows.first
  static let topPadding = window?.safeAreaInsets.top
  static let bottomPadding = window?.safeAreaInsets.bottom
}

extension String {
  func range(from nsRange: NSRange) -> Range<String.Index>? {
    guard
      let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
      let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
      let from = String.Index(from16, within: self),
      let to = String.Index(to16, within: self)
    else { return nil }
    return from ..< to
  }

  func nsRange(from range: Range<String.Index>) -> NSRange {
    let from = range.lowerBound.samePosition(in: utf16)
    let to = range.upperBound.samePosition(in: utf16)
    return NSRange(location: utf16.distance(from: utf16.startIndex, to: from!),
                   length: utf16.distance(from: from!, to: to!))
  }

  func toRegex() -> NSRegularExpression {
    var pattern = NSRegularExpression()

    do {
      try pattern = NSRegularExpression(pattern: self, options: .anchorsMatchLines)
    } catch {
      print(error)
    }

    return pattern
  }
}

// MARK: - Core Data configuration

private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

// 增
func insertBook(title: String, author: String) {
  let entity = NSEntityDescription.entity(forEntityName: "Book", in: context)!

  let book = Book(entity: entity, insertInto: context)
  book.title = title
  book.author = author

  do { try context.save()
  } catch let error as NSError {
    print("Could not save. \(error), \(error.userInfo)")
  }
}

func insertText(title: String, body: String, type: String, bookName: String, id: UUID?) {
  let entity = NSEntityDescription.entity(forEntityName: "Text", in: context)!
  let text = Text(entity: entity, insertInto: context)
  text.title = title
  text.body = body
  text.type = type
  text.id = id ?? UUID()

  let books = fetchBook()

  var targetBook: Book!
  for book in books {
    if (book.value(forKey: "title") as! String) == bookName {
      targetBook = book
    }
  }
  text.book = targetBook

  do { try context.save()
  } catch let error as NSError {
    print("Could not save. \(error), \(error.userInfo)")
  }
}

// 查
func fetchBook() -> [Book] {
  var results: [Book] = []

  let fetchRequest = NSFetchRequest<Book>(entityName: "Book")

  do { results = try context.fetch(fetchRequest)
  } catch let error as NSError {
    print("Could not fetch. \(error), \(error.userInfo)")
  }

  return results
}

func fetchAllTexts() -> [Text] {
  var texts: [Text] = []
  let fetchRequest = NSFetchRequest<Text>(entityName: "Text")

  do {
    texts = try context.fetch(fetchRequest)
  } catch let error as NSError {
    print("Could not fetch. \(error), \(error.userInfo)")
  }

  return texts
}

// 改
func saveText(id: UUID, title: String, body: String, type: String) {
  let fetchRequest = NSFetchRequest<Text>(entityName: "Text")

  do {
    var targetText: Text!
    let texts = try context.fetch(fetchRequest)
    for text in texts {
      if text.id == id {
        targetText = text
      }
    }

    targetText.title = title
    targetText.body = body
    targetText.type = type
    try context.save()

  } catch let error as NSError {
    print("Could not fetch. \(error), \(error.userInfo)")
  }
}

func fetchText(_ uuid: UUID) -> Text {
  let texts = fetchAllTexts()

  var targetText: Text!

  for text in texts {
    if text.id! == uuid {
      targetText = text
    }
  }

  return targetText
}

func initBtnList() {
  let textBtn = ["indent", "redo", "comma", "period", "dayton", "question", "colon", "quotes", "sqrBrackets", "guillemets"]
  let mdBtn = [""]

  UserDefaults.standard.set(textBtn, forKey: "TextBtn")
  UserDefaults.standard.set(mdBtn, forKey: "MDBtn")
}

enum Type: String {
  case Text = "TextBtn"
  case MD = "MDBtn"
}

enum ButtonType {
  case null
  case ShortcutBtn
  case FunctionalBtn
}

func fetchButtonList(with type: Type) -> NSMutableArray {
  UserDefaults.standard.mutableArrayValue(forKey: type.rawValue)
}

func setButtonList(array: NSMutableArray, with type: Type) {
  UserDefaults.standard.set(array, forKey: type.rawValue)
}

func fetchButtonTypeDictionary() -> [String: ButtonType] {
  ["redo": .FunctionalBtn,
   "jumpToTop": .FunctionalBtn,
   "jumpToBottom": .FunctionalBtn,
   "indent": .ShortcutBtn,
   "comma": .ShortcutBtn,
   "period": .ShortcutBtn,
   "dayton": .ShortcutBtn,
   "question": .ShortcutBtn,
   "colon": .ShortcutBtn,
   "quotes": .ShortcutBtn,
   "sqrBrackets": .ShortcutBtn,
   "guillemets": .ShortcutBtn]
}
