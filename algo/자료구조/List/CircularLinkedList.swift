//
//  CircularLinkedList.swift
//  algo
//
//  Created by 김민재 on 2023/08/05.
//

import Foundation


class CircularLinkedList<T> {

    class Node<T> {
        var value: T?
        var next: Node?

        init(value: T?, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }

    var head = Node<T>(value: nil)

    var count = 0

    var isEmpty: Bool {
        count == 0
    }

    /// 맨 앞에 넣기: O(1)
    func push(_ value: T) {
        defer {
            count += 1
        }

        let newNode = Node(value: value)
        if isEmpty {
            newNode.next = newNode
            head.next = newNode
            return
        }

        let lastNode = head.next

        newNode.next = lastNode?.next
        lastNode?.next = newNode
    }

    /// 맨 뒤에 넣기: O(1)
    func append(_ value: T) {
        defer {
            count += 1
        }

        let newNode = Node(value: value, next: head)
        let lastNode = head.next

        newNode.next = lastNode?.next
        lastNode?.next = newNode
        head.next = newNode
    }

    /// O(1)
    func removeFirst() -> T? {
        defer {
            count -= 1
        }

        let target = head.next?.next?.value
        head.next?.next = head.next?.next?.next
        return target
    }

    /// O(n): 단방향이기 때문에 선행 노드를 찾기위해서 어쩔수없음
    func removeLast() -> T? {
        defer {
            count -= 1
        }

        let lastNode = head.next

        var curr = head.next?.next
        while curr?.next !== lastNode {
            curr = curr?.next
        }

        let removedValue = curr?.next?.value
        curr?.next = lastNode?.next
        head.next = curr
        return removedValue
    }

}

extension CircularLinkedList: CustomStringConvertible {
    var description: String {
        var str = ""
        str += "head ["

        let firstNode = head.next?.next // 첫번째
        var curr = head.next?.next // head의 next는 마지막 노드의 next는 첫번째

        while curr?.next !== firstNode {
            str += "\(curr?.value), "
            curr = curr?.next
        }
        str += "\(curr?.value)"
        str += "] tail"
        return str
    }
}

var c = CircularLinkedList<Int>()

c.push(1)
c.push(2)
c.push(3)
//c.push(4)
//c.push(5)
//c.push(6)


print(c)

c.append(10)
print(c)

c.append(11)

print(c)

print(c.removeFirst())
print(c)

print(c.removeLast())
print(c)
print(c.count)
//let times = 100000
//var durationTime = 0.0, startTime = 0.0
//
//startTime = CFAbsoluteTimeGetCurrent()
//
//// 작업
//
//durationTime = CFAbsoluteTimeGetCurrent() - startTime
//print("myQueue enqueue: \(durationTime)\n")
