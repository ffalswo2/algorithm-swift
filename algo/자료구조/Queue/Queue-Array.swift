//
//  main.swift
//  algo
//
//  Created by 김민재 on 2023/08/04.
//

import Foundation

/// Circular Queue
struct Queue<T> {
    var items: [T?]
    var front = 0
    var rear = -1
    var size: Int

    init(size: Int) {
        self.size = size
        self.items = Array(repeating: nil, count: size)
    }

    mutating func enqueue(_ item: T) {
        rear += 1
        if rear == size {
            rear %= size
        }
        items[rear] = item

    }

    mutating func dequeue() -> T {
        let tmp = items[front]
        items[front] = nil
        front += 1
        return tmp!
    }

    func getFront() -> T {
        items[front]!
    }

    func getRear() -> T {
        items[rear]!
    }

}


var q = Queue<Int>(size: 5)

q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.enqueue(4)
q.enqueue(5)


print(q.items)

print("dequeue !!")
print(q.dequeue())
print(q.dequeue())
print(q.dequeue())


print(q.enqueue(6))
print(q.enqueue(7))
print(q.enqueue(8))

print(q.dequeue())
print(q.dequeue())

print(q.items)
