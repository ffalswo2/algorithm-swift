//
//  main.swift
//  algo
//
//  Created by 김민재 on 2023/08/17.
//

import Foundation

final class Node<T: Comparable> {
    var value: T
    var left: Node?
    var right: Node?

    init(value: T, left: Node? = nil, right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}


final class BST<T: Comparable> {

    var root: Node<T>?

    func search(_ value: T) -> T? {
        guard root != nil else { return nil }
        return searchHelper(value, root: self.root!)?.value
    }

    private func searchHelper(_ value: T, root: Node<T>?) -> Node<T>? {
        guard let root else { return nil }
        if value == root.value {
            return root
        } else if value < root.value {
            return searchHelper(value, root: root.left)
        } else {
            return searchHelper(value, root: root.right)
        }
    }

    func insert(_ value: T) {
        self.root = insertHelper(value, rt: self.root)
    }

    private func insertHelper(_ value: T, rt: Node<T>?) -> Node<T>? {
        // rt가 nil이면 거기가 곧 삽입되어야할 자리
        guard let root = rt else {
            // 노드를 만들고 return하면 caller쪽에서 해당 노드를...
            return Node(value: value)
        }

        if value < root.value {
            let newNode = insertHelper(value, rt: root.left)
            // return받은 새로 만들어진 노드를 연결
            root.left = newNode
        } else if value > root.value {
            let newNode = insertHelper(value, rt: root.right)
            // return받은 새로 만들어진 노드를 연결
            root.right = newNode
        }

        return root
    }

    func remove(_ value: T) {
        guard let root = self.root else { return }
        // root 트리에서 value가 제거된 새로운 트리의 root가 리턴되기에 root다시 할당
        self.root = removeHelper(value, rt: root)
    }

    /// removeHelper
    /// - Parameters:
    ///   - value: 지우고 싶은 값
    ///   - rt: 트리의 root
    /// - Returns: value가 지워진 서브트리의 새로운 root
    private func removeHelper(_ value: T, rt: Node<T>?) -> Node<T>? {
        guard let root = rt else { return nil }
        if value > root.value {
            // value가 지워진 서브트리의 새로운 root이기에 연결
            root.right = removeHelper(value, rt: root.right)
        } else if value < root.value {
            root.left = removeHelper(value, rt: root.left)
        } else { // remove할 target 발견 !


            // 1. 자식이 없는 경우 -> 그냥 지우면 됨
            // nil을 return시키면 재귀함수기 때문에 caller입장(parent)에서 nil을 연결하는 것이기 때문에 연결을 끊는 효과 발생함.
            if root.left == nil && root.right == nil { return nil }

            // 2. 자식이 하나 있는 경우
            // 2-1. 왼쪽 subtree가 없는 경우
            if root.left == nil {
                // 2-1-a 오른쪽 subtree의 root를 이으면 됨.
                return root.right
            }
            // 2-2. 오른쪽 subtree가 없는 경우
            else if root.right == nil {
                // 2-2-a. 왼쪽 subtree의 root를 이으면 됨.
                return root.left
            }
            // 3. 자식이 둘인 경우
            else {

                // 오른쪽 subtree에서 가장 작은 값을 가진 노드 찾아서..
                let minNode = findMinimumRightSubtree(rt: root.right)
                // 삭제할 노드랑 대체하고
                root.value = minNode!.value
                // 재연결
                root.right = removeHelper(minNode!.value, rt: root.right)
            }
        }

        return root
    }

    private func findMinimumRightSubtree(rt: Node<T>?) -> Node<T>? {

        guard let root = rt?.left else {
            // 왼쪽 subtree가 없으면 제일 작은 노드 찾았다 !
            return rt
        }
        return findMinimumRightSubtree(rt: root)
    }

    func inorderPrint(root: Node<T>?) {
        guard let root else { return }

        inorderPrint(root: root.left)
        print(root.value, terminator: " ")
        inorderPrint(root: root.right)
    }

    func preorderPrint(root: Node<T>?) {
        guard let root else { return }

        print(root.value, terminator: " ")
        preorderPrint(root: root.left)
        preorderPrint(root: root.right)
    }

    func postorderPrint(root: Node<T>?) {
        guard let root else { return }

        postorderPrint(root: root.left)
        postorderPrint(root: root.right)
        print(root.value, terminator: " ")
    }
}

var bst = BST<Int>()

bst.insert(10)
bst.insert(9)
bst.insert(20)
bst.insert(30)
bst.insert(12)

print(bst.search(12))
print(bst.search(30))
print(bst.search(40))

bst.inorderPrint(root: bst.root)
print("")

bst.remove(20)

bst.inorderPrint(root: bst.root)
print("")


//
