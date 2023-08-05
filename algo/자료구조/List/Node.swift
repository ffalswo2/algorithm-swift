//
//  Node.swift
//  algo
//
//  Created by 김민재 on 2023/08/05.
//

import Foundation

class Node<T> {
    var value: T
    var next: Node?

    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next else { return "\(value)" }
        return "\(value) -> " + String(describing: next) + " "
    }
}
