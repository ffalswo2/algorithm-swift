//
//  stack.swift
//  algo
//
//  Created by 김민재 on 2023/08/01.
//

import Foundation


struct stack<T> {
    var elemensts: [T] = []

    var isEmpty: Bool {
        elemensts.isEmpty
    }

    mutating func push(element: T) {
        elemensts.append(element)
    }

    @discardableResult
    mutating func pop() -> T? {
        elemensts.popLast()
    }

    func peek() -> T? {
        elemensts.last
    }

}

var s = stack<Int>()
s.push(element: 1)
s.push(element: 2)
print(s.elemensts)

print(s.pop())
print(s.pop())
print(s.pop())
print(s.elemensts)
s.push(element: 20)
print(s.isEmpty)
