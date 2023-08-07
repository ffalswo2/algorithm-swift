//
//  DLinkedList.swift
//  algo
//
//  Created by 김민재 on 2023/08/05.
//

import Foundation


class DLinkedList<T> {

    class Node<T> {
        var value: T?
        var previous: Node?
        var next: Node?

        init(
            value: T?,
            previous: Node? = nil,
            next: Node? = nil) {
            self.value = value
            self.previous = previous
            self.next = next
        }
    }

    var head: Node<T>
    var tail: Node<T>
    var count = 0

    init() {
        tail = Node(value: nil, previous: nil, next: nil)
        head = Node(value: nil, previous: nil, next: nil)

        head.next = tail
        tail.previous = head

    }

    /// O(1)
    func append(_ value: T) {
        let newNode = Node(value: value, previous: tail.previous, next: tail)
        tail.previous?.next = newNode
        tail.previous = newNode

        count += 1
    }

    /// O(n): search때문에
    func insert(at pos: Int, value: T) {
        var curr = head

        for _ in 0..<pos {
            curr = curr.next!
        }

        let newNode = Node(value: value, previous: curr, next: curr.next)
        curr.next = newNode
        curr.next?.next?.previous = newNode

        count += 1
    }

    /// O(n): search때문에
    func remove(at pos: Int) -> T? {
        var curr = head
        for _ in 0..<pos {
            curr = curr.next!
        }

        let tmp = curr.next?.value

        curr.next = curr.next?.next
        curr.next?.next?.previous = curr

        count -= 1
        return tmp
    }

}

extension DLinkedList: CustomStringConvertible {
    var description: String {
        var str = ""
        str += "head ["

        var curr = head.next
        while curr?.next != nil {
            str += "\(curr?.value), "
            curr = curr?.next!
        }
        str += "] tail"
        return str
    }

}

var d = DLinkedList<Int>()
d.append(1)
d.append(2)
d.append(3)
d.append(4)

d.insert(at: 1, value: 10)
d.insert(at: 1, value: 30)
print(d, "count : ", d.count)

print("removed : ", d.remove(at: 1))
print(d, "count : ", d.count)

print("removed : ", d.remove(at: 2))
print(d, "count : ", d.count)





