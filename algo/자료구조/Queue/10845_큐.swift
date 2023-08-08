//
//  10845_큐.swift
//  algo
//
//  Created by 김민재 on 2023/08/08.
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

class Queue {

    var head = Node(value: nil)
    var tail = Node(value: nil)

    var front: Int {
        guard let value = head.next?.value else {
            return -1
        }
        return value
    }

    var back: Int {
        guard let value = tail.next?.value else {
            return -1
        }
        return value
    }

    var size = 0

    var empty: Int {
        size == 0 ? 1 : 0
    }

    func push(_ value: Int) {
        defer {
            size += 1
        }

        let newNode = Node(value: value)
        if empty == 1 {
            head.next = newNode
            tail.next = newNode
            return
        }

        tail.next?.next = newNode
        tail.next = newNode
    }

    func pop() -> Int {
        if size == 0 {
            return -1
        }

        let target = head.next?.value

        /// 마지막 pop할 시에 tail.next도 nil로 해줘야 back에서도 알맞은 값이 뜸
        if head.next === tail.next {
            tail.next = nil
        }
        head.next = head.next?.next
        size -= 1

        return target!
    }
}

//extension Queue: CustomStringConvertible {
//    var description: String {
//        var str = "front ["
//        var tmp = head
//        while tmp.next != nil {
//            tmp = tmp.next!
//            str += "\(tmp.value), "
//        }
//        str += "] rear"
//        return str
//    }
//}


enum Command: String {
    case push
    case pop
    case size
    case empty
    case front
    case back
}


let n = Int(readLine()!)!
var q = Queue()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    let command = Command(rawValue: String(input[0]))!

    switch command {
    case .push:
        q.push(Int(input[1])!)
    case .pop:
        print(q.pop())
    case .size:
        print(q.size)
    case .empty:
        print(q.empty)
    case .front:
        print(q.front)
    case .back:
        print(q.back)
    }
}



