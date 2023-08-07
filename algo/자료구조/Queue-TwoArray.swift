//
//  main.swift
//  algo
//
//  Created by 김민재 on 2022/09/14.
//

import Foundation


class Queue<T> {
    private var enQueue: [T] = []
    private var deQueue: [T] = []
    
    var count: Int {
        return enQueue.count + deQueue.count
    }
    
    var isEmpty: Bool {
        return enQueue.isEmpty && deQueue.isEmpty
    }
    
    init() {}
    
    func push(_ element: T) {
        enQueue.append(element)
    }
    
    func pop() -> T {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        
        return deQueue.removeLast()
    }
}


let q = Queue<Int>()
q.push(1)
q.push(2)
q.push(3)

print(q.pop())
print(q.pop())

