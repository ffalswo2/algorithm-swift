//
//  main.swift
//  algo
//
//  Created by 김민재 on 2023/08/17.
//

import Foundation

final class Heap {

    var elements: [Int]

    init(elements: [Int] = []) {
        self.elements = elements
        heapify()
    }

    func insert(_ element: Int) {
        elements.append(element)
        shiftUp(elements.count - 1)
    }

    func parent(of r: Int) -> Int {
        return (r-1) / 2
    }

    func leftChild(of r: Int) -> Int {
        return 2 * r + 1
    }

    func rightChild(of r: Int) -> Int {
        return 2 * r + 2
    }

    func shiftUp(_ index: Int) {
        var index = index
        var parentIndex = parent(of: index)

        while elements[index] > elements[parentIndex] && parentIndex >= 0 {
            elements.swapAt(index, parentIndex)

            index = parentIndex
            parentIndex = parent(of: parentIndex)
        }
    }

    func removeMostPriority() -> Int? {
        elements.swapAt(0, elements.count - 1)
        let removed = elements.popLast()

        shiftDown(0)

        return removed
    }

    func shiftDown(_ index: Int) {
        var leftChildIndex = leftChild(of: index)
        var rightChildIndex = rightChild(of: index)

        var prior = getPriortier(left: leftChildIndex, right: rightChildIndex)

        while prior < elements.count {
            if elements[index] > elements[prior] {
                return
            }
            elements.swapAt(index, prior)

            leftChildIndex = leftChild(of: prior)
            rightChildIndex = rightChild(of: prior)

            if leftChildIndex >= elements.count && rightChildIndex >= elements.count { return }
            else if leftChildIndex >= elements.count {
                prior = rightChildIndex
            } else if rightChildIndex >= elements.count {
                prior = leftChildIndex
            } else {
                prior = getPriortier(left: leftChildIndex, right: rightChildIndex)
            }
        }
        
    }

    func getPriortier(left a: Int, right b: Int) -> Int {
        let left = elements[a]
        let right = elements[b]
        return left > right ? a : b
    }

    func heapify() {

        for i in (0..<elements.count/2).reversed() {
            shiftDown(i)
        }
    }

}

//var heap = Heap()
//
//heap.insert(1) // 1
//
//print(heap.elements) // 1
//heap.insert(10) // 10 1
//heap.insert(20) //  20
//                // 1 10
//
//print(heap.elements) // 20 1 10
//
//heap.insert(40)
////   40
////  20 10
//// 1
//
//print(heap.elements) // 40 20 10 1
//
//heap.insert(30)
//
////   40
////  30 10
//// 1 20      --> 40 30 10 1 20
//
//print(heap.elements)
//
//
//print(heap.removeMostPriority()) // 40
//
//print(heap.elements)
//
////   20
////  30 10
//// 1
//
////   30
////  20 10
//// 1         --> 30 20 10 1
//
//print(heap.elements)
//
//
//print(heap.removeMostPriority())
////   30
////  20 10
//// 1         --> 30 20 10 1
//
////   1
//// 20 10
//
//// 20
////1 10 --> 20 1 10
//
//print(heap.elements)
/// ------------
var heap = Heap(elements: [1, 8, 3, 10, 6, 2, 9, 11, 12, 4, 5, 13, 7])
heap.heapify()

print(heap.elements)

