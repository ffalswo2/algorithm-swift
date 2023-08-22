//
//  1991_트리 순회.swift
//  algo
//
//  Created by 김민재 on 2023/08/18.
//

import Foundation

let N = Int(readLine()!)!

// Key: (left, right)
var bstArr: [String: (String, String)] = [:]

func inorder(root: String?) {
    if root == "." { return }

    guard let root = root else { return }
    inorder(root: bstArr[root]?.0)
    print(root, terminator: "")
    inorder(root: bstArr[root]?.1)
}

func preorder(root: String?) {
    if root == "." { return }

    guard let root = root else { return }
    print(root, terminator: "")
    preorder(root: bstArr[root]?.0)
    preorder(root: bstArr[root]?.1)
}

func postorder(root: String?) {
    if root == "." { return }

    guard let root = root else { return }

    postorder(root: bstArr[root]?.0)
    postorder(root: bstArr[root]?.1)
    print(root, terminator: "")
}

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let value = input[0]
    let leftValue = input[1]
    let rightValue = input[2]

    bstArr[value] = (leftValue, rightValue)
}

let root = "A"
preorder(root: root)
print("")
inorder(root: root)
print("")
postorder(root: root)
print("")
