//
//  10828_스택.swift
//  algo
//
//  Created by 김민재 on 2023/08/09.
//

import Foundation

class Node {
    var value: Int?
    var next: Node?

    init(value: Int?, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}



enum Command: String {
    case push
    case pop
    case size
    case empty
    case top
}

class Stack {

    var top: Int {
        guard let value = tail.next?.value else {
            return -1
        }
        return value

    }

    var size = 0

    var empty: Int {
        size == 0 ? 1 : 0
    }

    var tail = Node(value: nil)

    func push(_ value: Int) {
        defer {
            size += 1
        }

        let newNode = Node(value: value)
        if empty == 1 {
            tail.next = newNode
            return
        }

        newNode.next = tail.next
        tail.next = newNode
    }

    func pop() -> Int {
        if size == 0 {
            return -1
        }
        size = max(0, size - 1)
        let target = tail.next?.value
        tail.next = tail.next?.next
        return target!
    }

}


let n = Int(readLine()!)!
var s = Stack()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    let command = Command(rawValue: String(input[0]))!

    switch command {
    case .push:
        s.push(Int(input[1])!)
    case .pop:
        print(s.pop())
    case .size:
        print(s.size)
    case .empty:
        print(s.empty)
    case .top:
        print(s.top)
    }
}
