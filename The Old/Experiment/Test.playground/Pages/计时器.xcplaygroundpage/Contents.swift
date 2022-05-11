import Foundation
import UIKit

var time = DispatchSource.makeTimerSource()
// 倒计时的总时间 初始值自己填写
var times = TimeInterval()
// repeating代表间隔1秒
time.schedule(deadline: .now(), repeating: 1)
