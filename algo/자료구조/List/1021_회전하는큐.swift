//
//  1021_회전하는큐.swift
//  algo
//
//  Created by 김민재 on 2023/08/08.
//

import Foundation

class Node {
    var value: Int?
    var prev: Node?
    var next: Node?

    init(value: Int?, prev: Node? = nil, next: Node? = nil) {
        self.value = value
        self.prev = prev
        self.next = next
    }
}

class CircularLinkedList {
    var head = Node(value: nil)
    var last = Node(value: nil)

    func removeFirst() -> Int? {
        let target = head.next?.value

        last.next?.next = head.next?.next
        head.next?.next?.prev = last.next

        head.next = head.next?.next
        return target
    }

    func append(_ value: Int) {
        let newNode = Node(value: value)
        if head.next == nil {
            newNode.next = newNode
            newNode.prev = newNode
            head.next = newNode
            last.next = newNode
            return
        }

        newNode.next = head.next
        newNode.prev = last.next

        last.next?.next = newNode
        head.next?.prev = newNode // head추가되면서 새로 생긴 코드. 이것으로 모두 일관되게 처리가능.

        last.next = newNode
    }

    // 첫번째 노드가 마지막노드로
    func moveLeft() {
        last.next = head.next
        head.next = head.next?.next

    }


    func moveRight() {
        head.next = last.next
        last.next = last.next?.prev
    }

    // 왼쪽으로 땡기니까 오른쪽으로 이동하는 것
    func moveLeftDistance(_ target: Int) -> Int {
        var distance = 0

        var firstNode = head.next
        while firstNode?.value != target {
            firstNode = firstNode?.next
            distance += 1
        }

        return distance
    }

    // 오른쪽으로 땡기니까 왼쪽으로 이동하는 것
    func moveRightDistance(_ target: Int) -> Int {
        var distance = 0

        var firstNode = head.next
        while firstNode?.value != target {
            firstNode = firstNode?.prev
            distance += 1
        }
        return distance
    }


}

extension CircularLinkedList: CustomStringConvertible {
    var description: String {
        var str = ""
        str += "head ["

        let firstNode = head.next // 첫번째
        var curr = head.next // head의 next는 마지막 노드의 next는 첫번째

        while curr?.next !== firstNode {
            str += "\(curr?.value), "
            curr = curr?.next
        }
        str += "\(curr?.value)"
        str += "] tail"
        return str
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0] // 크기
let M = input[1] //
let targets = readLine()!.split(separator: " ").map { Int($0)! }

var list = CircularLinkedList()
for i in 1...N {
    list.append(i)
}

var count = 0
for i in targets {
    let moveLeftDist = list.moveLeftDistance(i)
    let moveRightDist = list.moveRightDistance(i)
    if moveLeftDist > moveRightDist {
        for _ in 0..<moveRightDist {
            list.moveRight()
        }
        count += moveRightDist
    } else {
        for _ in 0..<moveLeftDist {
            list.moveLeft()
        }
        count += moveLeftDist
    }
    list.removeFirst()
}

print(count)


/*
 last, 즉 마지막 노드에 대한 포인터만 가지고 하니까 이슈가 있었음.
 append로 넣을 때 1->2개로 늘어날 때에는 이전 선행 노드가 첫번째 노드이기 때문에, 해당 노드의 prev를 newNode로 해줘야하는데
 3개 이상인 경우에서는 선행 노드가 head가 아니기 때문에 이러한 처리가 필요없음. 따라서 분기처리가 필요하게되는데 이는 코드의 복잡성을 늘리는 방향이기에
 head를 추가해서 일관된 처리를 할 수 있게끔 수정하였음.


 양방향으로 했던 이유는 좌, 우 움직이면서 가까운 방향으로 움직여야했기 때문에 이동이 좀 더 수월한 양방향 연결리스트로 구현하기로 함.

 */
