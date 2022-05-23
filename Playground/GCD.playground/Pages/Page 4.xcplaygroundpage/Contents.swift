import Foundation

let semaphore = DispatchSemaphore(value: 2)
let queue = DispatchQueue(label: "concurrent", attributes: .concurrent)
//执行9个异步任务
for i in 1...9 {
    queue.async {
        semaphore.wait()//通行数量减1，此处变为0，红灯，全都得等着
        var str = ""
        for j in 1...9{
            //格式化一下字符串，后面加两个空格。如果只有个位数的，前面补个空格
            let value = i * j
            let tempStr = value <= 9 ? " \(value)  " : "\(value)  "
            str += tempStr
        }
        print(str)
        semaphore.signal()//通行数量加1，后面可继续通行
    }
}
