//
//  stack-linkedlist.swift
//  algo
//
//  Created by 김민재 on 2023/08/03.
//

import Foundation


struct Stack<T> {

    var top: Node<T>?

    var count: Int = 0

    mutating func push(_ value: T) {
        count += 1
        top = Node(value: value, next: top)
    }

    mutating func pop() -> T? {
        count = max(0, count - 1)
        var popValue = top?.value
        top = top?.next
        return popValue
    }

    mutating func clear() {
        count = 0
        top = nil
    }

    func peak() -> T? {
        top?.value
    }
}


var s = Stack<Int>()

s.push(10)
s.push(11)
s.push(12)
print("count: ", s.count) // 3

print("top: ", s.peak())
print("pop !!! :", s.pop())
print("count: ", s.count) // 2
print("top: ", s.peak())
print("twice pop")
print("pop !!! :", s.pop())
print("pop !!! :", s.pop())
print("count: ", s.count) // 0

print(s.pop())
print("top: ", s.peak())
print("count: ", s.count) // 0

s.push(20)
print("top: ", s.peak())
print("count: ", s.count)


print(s.pop()) // 20
print(s.pop()) // nil
print(s.pop()) // nil

s.push(1)
s.push(2)
s.push(3)
s.push(4)
s.push(5)
print(s.count)

s.clear()
print(s.count)
print(s.peak())
