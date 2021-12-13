import UIKit

var greeting = "Hello,\nplayground"
let formatter = DateFormatter()
formatter.dateFormat="YYYY-MM-dd HH:mm"
let date = formatter.string(from: Date())
print(date)
print(greeting)

let random1 = arc4random()%3
