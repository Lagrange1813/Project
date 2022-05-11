//
//  CommonTextVC.swift
//  Notepad
//
//  Created by 张维熙 on 2022/3/27.
//

import UIKit
import CoreData
import RxSwift
import RxCocoa
import SnapKit

class CommonTextViewController: UIViewController {
  var barHeight: CGFloat = 0
  
  var topAnchor: CGFloat = 0
  var bottomAnchor: CGFloat = 0
  
  var topPadding: CGFloat = 0
  var bottomPadding: CGFloat = 0
  
  var showCounter: Bool = true
  var toSaveText: Bool = true
  
  var textField: BaseTextView!
  
  var type: String!
  
  var texts: [Text] = []
  var currentText: Text!
//  var counter: WordCounter!
  
  var theme: Theme!
  var textTheme: Theme!
  var markdownTheme: Theme!
  
  let bag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    
  }
  
  func loadData() {
    texts = fetchAllTexts()
  }
  
  func loadInfo() {
    let userDefaults = UserDefaults.standard
    let id = userDefaults.value(forKey: "CurrentTextID") as! String
    var targetText: Text!
    
    for text in texts {
      if text.id! == UUID(uuidString: id) {
        targetText = text
      }
    }
    
    type = targetText.type
    userDefaults.set(type, forKey: "CurrentTextType")
    currentText = targetText
  }
  
  
}
