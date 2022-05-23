import Foundation

//定义四个调度任务，打印当前线程数据
let item1 = DispatchWorkItem {
    for i in 0...4 {
        print("item1 -> \(i)  thread: \(Thread.current)")
    }
}

let item2 = DispatchWorkItem {
    for i in 0...4 {
        print("item2 -> \(i)  thread: \(Thread.current)")
    }
}

let item3 = DispatchWorkItem {
    for i in 0...4 {
        print("item3 -> \(i)  thread: \(Thread.current)")
    }
}

let item4 = DispatchWorkItem {
    for i in 0...4 {
        print("item4 -> \(i)  thread: \(Thread.current)")
    }
}

print("=> 开始执行")

let mainQueue = DispatchQueue.main
mainQueue.async(execute: item1)//异步任务

print("=> 执行完毕1")

let globalQueue = DispatchQueue.global()
globalQueue.sync(execute: item2)//同步任务

print("=> 执行完毕2")

let serialQueue = DispatchQueue(label: "serial")
serialQueue.sync(execute: item3)//同步任务

print("=> 执行完毕3")

let concurrentQueue = DispatchQueue(label: "concurrent", attributes: .concurrent)
concurrentQueue.sync(execute: item4)//同步任务

print("=> 执行完毕all")
