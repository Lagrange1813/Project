//
// Created by 张维熙 on 2022/4/3.
//

import UIKit

class ViewController<Container: UIView>: UIViewController {
  var container: Container { view as! Container }

  override func loadView() {
    super.loadView()
    if view is Container { return }
    view = Container()
  }
}
