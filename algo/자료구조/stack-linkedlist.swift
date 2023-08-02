//
//  stack-linkedlist.swift
//  algo
//
//  Created by 김민재 on 2023/08/03.
//

import Foundation


class Node<T> {
    var value: T
    var next: Node?

    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}


struct Stack<T> {

    var tail: Node<T>? // stack의 경우 마지막만 보면 됨.

    var count: Int = 0

    mutating func push(_ value: T) {
        count += 1

        tail = Node(value: value, next: tail)

    }

    mutating func pop() -> T? {
        if count == 0 {
            return nil
        }

        count -= 1
        var tmp = tail?.next?.value
        tail = tail?.next
        return tmp
    }
}


var s = Stack<Int>()

s.push(10)
s.push(11)
s.push(12)

print(s.tail?.value)
print(s.pop())
print(s.tail?.value)
s.pop()
print(s.tail?.value)
s.pop()
print(s.tail?.value)
