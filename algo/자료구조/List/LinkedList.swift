//
//  LinkedList.swift
//  algo
//
//  Created by 김민재 on 2023/08/02.
//

import Foundation




/**

 삽입:
 - push: 맨 앞에 넣기
 - append: 맨 뒤에 넣기
 - insert: 중간에 넣기

 삭제:
 - pop: 맨 앞 빼기
 - removeLast: 마지막 빼기
 - remove(at:): 중간 값 빼기

 */

struct LinkedList<T> {

    var head: Node<T>?
    var tail: Node<T>?

    var isEmpty: Bool {
        head == nil
    }

    init() {}

    /// push: 맨 앞에 넣기 O(1)
    mutating func push(_ value: T) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }

    /// append: 맨 뒤에 넣기 O(1)
    mutating func append(_ value: T) {
        guard !isEmpty else {
            // List가 비어있다면 PUSH를 통해서 맨 앞에 넣어주고 early return
            push(value)
            return
        }

        tail?.next = Node(value: value, next: nil) // tail의 next포인터에 새로운 노드를 만들어서 가리키게끔 해주고
        tail = tail?.next // tail을 방금 추가한 노드로 바꿔주기
    }

    /// search: 앞에서부터 검색 O(N)
    func search(at index: Int) -> Node<T>? {
        var curr = 0
        var currNode = head
        while currNode != nil && curr < index {
            currNode = currNode?.next
            curr += 1
        }

        return currNode
    }

    /// insert: 중간에 넣기 O(1)
    @discardableResult
    mutating func insert(_ value: T, after node: Node<T>) -> Node<T> {
        if tail === node {
            append(value)
            return tail!
        }

        node.next = Node(value: value, next: node.next)
        return node.next!
    }

    /// pop: 맨 앞에 빼기 O(1)
    mutating func pop() -> Node<T>? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }

        return head
    }

    /// removeLast: 맨 뒤에 빼기
    mutating func removeLast() -> Node<T>? {
        if tail == nil {
            return nil
        }

        var prevNode = head
        let prevTailNode = tail
        while prevNode?.next !== tail {
            prevNode = prevNode?.next
        }

        prevNode?.next = nil

        tail = prevNode
        return prevTailNode
    }

    mutating func remove(after node: Node<T>) -> Node<T>? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }

        return node.next
    }

    func iterator() -> any ListIterator {
        return LinkedListIterator(head: head!)
    }
    
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head else { return "Empty List !"}
        return String(describing: head)
    }
}


struct LinkedListIterator<T>: ListIterator {

    private var curr: Node<T>?

    init(head: Node<T>) {
        self.curr = head
    }

    func hasNext() -> Bool {
        if curr?.next != nil {
            return true
        }
        return false
    }

    mutating func next() -> T? {
        curr = curr?.next
        return curr?.value
    }

    func hasPrevious() -> Bool {
        return true
    }

    mutating func previous() -> T? {
        return curr?.value
    }
}


var linkedList = LinkedList<Int>()
linkedList.push(1)
linkedList.push(2)
linkedList.push(3)
linkedList.push(4)
print("=====PUSH=====")
print(linkedList)

linkedList.append(10)
print("=====APPEND=====")
print(linkedList)

let node = linkedList.search(at: 0)!
linkedList.insert(5, after: node)
print("=====INSERT=====")
print(linkedList)

print("=====POP=====")
print(linkedList.pop()?.value)
print("=====POP-AFTER=====")
print(linkedList)

print("=====REMOVE=====")
print(linkedList.removeLast()?.value)
print("=====REMOVE-AFTER=====")
print(linkedList)

print("=====SEARCH=====")
let targetNode = linkedList.search(at: 1)!
print(targetNode.value)
print("=====REMOVE-AFTER=====")
linkedList.remove(after: targetNode)
print(linkedList)


var itr = linkedList.iterator()
print(itr.hasNext())
print(itr.next())
print(itr.next())
print(itr.next())
print(itr.hasNext())
/*
LinkedList<int> LL;
LL.insert(0, 1); cout << LL << endl;
LL.insert(1, 2); cout << LL << endl;
LL.insert(2, 3); cout << LL << endl;
LL.insert(0, 4); cout << LL << endl;
LL.insert(0, 5); cout << LL << endl;
LL.insert(5, 6); cout << LL << endl;
LL.insert(4, 7); cout << LL << endl;
LL.insert(1, 8); cout << LL << endl;
LL.erase(4); cout << LL << endl;
LL.erase(0); cout << LL << endl;
LL.erase(5); cout << LL << endl;
LL.insert(3, 9); cout << LL << endl;
LL.erase(1); cout << LL << endl;
LL.insert(1, 10); cout << LL << endl;
*/
