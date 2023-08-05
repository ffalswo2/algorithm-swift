//
//  main.swift
//  algo
//
//  Created by 김민재 on 2023/08/04.
//

import Foundation

protocol List {
    associatedtype T

    func insert(pos: Int, value: T)
    func append(value: T)
    func update(pos: Int, value: T)
    func getValue(pos: Int) -> T
    func remove(pos: Int)
    func clear()

    var length: Int { get set }
    var iterator: any ListIterator { get set }
}

protocol ListIterator {
    associatedtype T
    func hasNext() -> Bool
    mutating func next() -> T?
    func hasPrevious() -> Bool
    mutating func previous() -> T?
}

