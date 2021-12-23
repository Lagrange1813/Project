//: [Previous](@previous)

import Foundation

class FixedSizeQueue<Item> {
    init() {}
    
    var n = 0
    var maxSize = 15
    
    class Node<Item> {
        var item: Item?
        var next: Node<Item>?
    }

    var first: Node<Item>?
    var last: Node<Item>?
    
    func isEmpty() -> Bool {
        return n == 0
    }

    func size() -> Int {
        return n
    }

    func enqueue(_ item: Item) {
        if n < maxSize {
            let oldlast = last
            last = Node()
            last?.item = item
            last?.next = nil
            if isEmpty() {
                first = last
            } else {
                oldlast?.next = last
            }
            n += 1
        } else {
            dequeue()
            let oldlast = last
            last = Node()
            last?.item = item
            last?.next = nil
            if isEmpty() {
                first = last
            } else {
                oldlast?.next = last
            }
            n += 1
        }
    }

    func dequeue() -> Item {
        let item = first?.item
        first = first?.next
        if isEmpty() {
            last = nil
        }
        n -= 1
        return item!
    }
}

let test = FixedSizeQueue<Int>()
for x in 0...18 {
    test.enqueue(x)
}
for _ in 0...14 {
    var x = test.dequeue()
    print(x)
}
