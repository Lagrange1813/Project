import Foundation

//创建并行队列，尽量用自定义队列，免得自己的代码质量不过关，影响全局队列
let queue = DispatchQueue(label: "com.apple.request", attributes: .concurrent)

//异步执行
queue.async {
    
    print("开始请求数据 \(Date())  thread: \(Thread.current)")
    sleep(10)//模拟网络请求
    print("数据请求完成 \(Date())  thread: \(Thread.current)")
    
    //异步执行
    queue.async {
        print("开始处理数据 \(Date())  thread: \(Thread.current)")
        sleep(5)//模拟数据处理
        print("数据处理完成 \(Date())  thread: \(Thread.current)")
        
        //切换到主队列，刷新UI
        DispatchQueue.main.async {
            print("UI刷新成功  \(Date())  thread: \(Thread.current)")
        }
    }
}
