//
//  최대힙, 최소힙.swift
//  algo
//
//  Created by 김민재 on 2023/08/18.
//

import Foundation


final class Heap {
    var elements: [Int]

    init(elements: [Int] = []) {
        self.elements = elements
    }

    func parent(of r: Int) -> Int {
        return (r - 1) / 2
    }

    func leftChild(of r: Int) -> Int {
        return 2 * r + 1
    }

    func rightChild(of r: Int) -> Int {
        return 2 * r + 2
    }

    func insert(_ value: Int) {
        elements.append(value)
        // shift up
        siftUp(elements.count - 1)
    }

    private func siftUp(_ index: Int) {

        var parentIndex = parent(of: index) // parent
        if parentIndex < 0 { return }

        if elements[parentIndex] < elements[index] {
            elements.swapAt(parentIndex, index)
            siftUp(parentIndex)
        }
    }

    func removeMaxPriority() -> Int {
        if elements.count == 0 { return 0 }
        elements.swapAt(elements.count - 1, 0)
        let removed = elements.popLast()

        // siftDown
        siftDown(0)


        return removed == nil ? 0 : removed!
    }

    private func siftDown(_ index: Int) {
        let leftChildIndex = leftChild(of: index)
        let rightChildIndex = rightChild(of: index)
        guard let maxPriorityChildIndex = getMaxPriorityChildIndex(leftChildIndex, rightChildIndex)
        else {
            return
        }

        if elements[maxPriorityChildIndex] <= elements[index] {
            return
        }
        elements.swapAt(maxPriorityChildIndex, index)
        siftDown(maxPriorityChildIndex)
    }

    private func getMaxPriorityChildIndex(_ left: Int, _ right: Int) -> Int? {
        let n = elements.count
        if left >= n && right >= n { return nil }
        else if left >= n { return right }
        else if right >= n { return left }

        if elements[left] > elements[right] {
            return left
        } else {
            return right
        }
    }


}

let N = Int(readLine()!)!
var heap = Heap()
for _ in 0..<N {
    let input = Int(readLine()!)!
    if input == 0 {
        print(-heap.removeMaxPriority())
        continue
    }

    heap.insert(-input)
}
