//
// Created by 张维熙 on 2022/4/3.
//

import UIKit

class MainView: UIView {
  let view = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    view.backgroundColor = .blue
    addSubview(view)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
