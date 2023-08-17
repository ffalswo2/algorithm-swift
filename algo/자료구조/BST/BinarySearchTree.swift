//
//  main.swift
//  algo
//
//  Created by 김민재 on 2023/08/11.
//

import Foundation


final class Node {
    var key: Int
    var left: Node?
    var right: Node?

    init(key: Int, left: Node? = nil, right: Node? = nil) {
        self.key = key
        self.left = left
        self.right = right
    }
}

final class Bst {

    var root: Node?

    func search(target: Int, root: Node?) -> Node? {
        guard let root else { return nil }
        if root.key == target {
            return root
        } else if target > root.key {
            return search(target: target, root: root.right)
        }
        return search(target: target, root: root.left)
    }

    func insert(key target: Int) {
        let newNode = Node(key: target)
        guard var root = self.root else {
            // root가 없다면 아무것도 없는 상태
            root = newNode
            return
        }

        var failNode: Node? // 넣을 값이 있는지 검사해서 없다면 검색이 끝나는 마지막 노드를 담을 변수

        // root가 nil이 나올 때까지 계속 탐색
        while root != nil {
            if root.key == target {
                return
            } else if target > root.key {
                // target보다 크면 오른쪽 subtree로 이동해야하는데
                // 오른쪽이 nil이면 검색 실패
                if root.right == nil {
                    //
                    failNode = root
                    break
                }

                // target보다 크면 오른쪽 subtree로 이동

                root = root.right!
            } else {
                // target보다 작으면 왼쪽 subtree로 이동해야하는데
                // 왼쪽이 nil이면 검색 실패
                if root.left == nil {
                    failNode = root
                    break
                }
                // target보다 작으면 오른쪽 subtree로 이동
                root = root.left!
            }
        }

        guard let failNode else { return }
        if target > failNode.key {
            failNode.right = newNode
        } else {
            failNode.left = newNode
        }
    }

    @discardableResult
    func remove(target: Int, root: Node?) -> Node? {
        guard let root else { return nil }

        if target > root.key {
            // target이 root의 키보다 크다면 ??
            // root의 오른쪽 subtree에서 target을 삭제하는 것과 동일한 문제이기에 재귀
            root.right = remove(target: target, root: root.right)
        } else if target < root.key {
            // same
            root.left = remove(target: target, root: root.left)
        } else {

            // target을 찾았다면?
            if root.left == nil && root.right == nil { return nil }

            if root.left == nil {
                // target 노드의 왼쪽 자식이 없다면 오른쪽 subtree를 이으면 되기 때문에 오른쪽 서브트리 리턴
                return root.right
            } else if root.right == nil {
                // target 노드의 오른쪽 자식이 없다면 왼쪽 subtree를 이으면 되기 때문에 왼쪽 서브트리 리턴
                return root.left
            } else {
                // 자식이 둘다 있으면? 왼쪽에서 가장 큰값 or 오른쪽에서 가장 작은값으로
                // 여기서는 임의로 오른쪽에서 가장 작은값으로 대체하는걸 기본으로 만들었음.

                var minValNode: Node? = root.right // 삭제할려는 노드의 오른쪽 subtree에서 가장 작은 값을 가진 노드.
                while minValNode?.left != nil {
                    // 왼쪽 자식이 없을 때 까지 간 노드가 가장 작은 값을 가진 노드
                    minValNode = minValNode?.left
                }
                root.key = minValNode!.key // 가장 작은 값을 노드 값에 덮어씌우기. 이제 링크를 바꿔줘야하는데
                // 오른쪽에서 가장 큰 값을 골랐기 때문에 right을 바꿔주면 됨.
                // 기존 가장 작은 값을 가지고 있던 노드 삭제 == 가장 작은 값을 가진 노드를 root로 하고 있던 subtree에서 가장 작은 값을 가진 노드 삭제
                root.right = remove(target: root.key, root: root.right) // 삭제
            }
        }

        return root
    }

    func inorderPrint(root: Node?) {
        guard let root else { return }

        inorderPrint(root: root.left)
        print(root.key, terminator: " ")
        inorderPrint(root: root.right)
    }

}

var bst = Bst()
//bst.insert(key: 10)
//bst.insert(key: 13)
//bst.insert(key: 20)
//bst.insert(key: 40)
//bst.insert(key: 35)
//bst.insert(key: 1)
//bst.insert(key: 4)
//bst.insert(key: 2)
//bst.insert(key: 3)
//bst.insert(key: 7)
//
//print(bst.search(target: 13, root: bst.root)?.key) // 13
//print(bst.search(target: 23, root: bst.root)?.key)
//
//bst.inorderPrint(root: bst.root)
//print("")
//
//bst.remove(target: 10, root: bst.root)
//bst.inorderPrint(root: bst.root)
//
//bst.remove(target: 4, root: bst.root)
//print("")
//
//bst.inorderPrint(root: bst.root)
//
//bst.remove(target: 13, root: bst.root)
//print("")
//
//bst.inorderPrint(root: bst.root)
//
//bst.insert(key: 50)
//bst.insert(key: 45)
//bst.insert(key: 60)
//print("")
//bst.inorderPrint(root: bst.root)
//
//
//bst.remove(target: 40, root: bst.root)
//print("")
//bst.inorderPrint(root: bst.root)

bst.insert(key: 35)
bst.insert(key: 10)
bst.insert(key: 40)
bst.insert(key: 7)
bst.insert(key: 30)
bst.insert(key: 25)
bst.insert(key: 33)
bst.insert(key: 16)
bst.insert(key: 28)
bst.insert(key: 34)
bst.insert(key: 18)

bst.inorderPrint(root: bst.root)

bst.remove(target: 30, root: bst.root)
print("")
bst.inorderPrint(root: bst.root)


