//
// Created by 张维熙 on 2022/4/3.
//

import UIKit

class SubView: MainView {

  let view2 = UIView(frame: CGRect(x: 150, y: 150, width: 100, height: 100))

  override init(frame:CGRect) {
    super.init(frame: frame)

    view2.backgroundColor = .yellow
    addSubview(view2)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
