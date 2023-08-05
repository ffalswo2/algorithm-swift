//
//  main.swift
//  algo
//
//  Created by 김민재 on 2023/08/04.
//

import Foundation


struct Queue<T> {
    var head: Node<T>?
    var tail: Node<T>?

    var count: Int = 0

    var front: T? {
        return head?.value
    }

    var rear: T? {
        return tail?.value
    }


    mutating func enqueue(_ value: T) {
        count += 1
        if tail == nil {
            tail = Node(value: value)
            head = tail
            return
        }

        tail?.next = Node(value: value)
        tail = tail?.next
    }

    mutating func dequeue() -> T? {
        count = max(0, count - 1)
        var tmp = head?.value
        head = head?.next
        return tmp
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        var str = "front ["
        var tmp = self.head
        for i in 0..<self.count {
            str += "\(tmp?.value)"
            tmp = tmp?.next
            if i < self.count - 1 {
                str += ", "
            }
        }
        str += "] rear"
        return str
    }
}

var q = Queue<Int>()
//print(q.dequeue())
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)

print(q.dequeue()) // 1

q.enqueue(25) // 2 3 25

print(q.front) // 2
print(q.rear) // 25


print(q)
