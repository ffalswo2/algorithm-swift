//
//  Heap.swift
//  algo
//
//  Created by 김민재 on 2022/09/18.
//

import Foundation

struct Heap<T: Comparable> {
    
    private var array: [T] = []
    private var orderCriteria: (T, T) -> Bool
    
    var isEmpty: Bool {
        return self.array.count == 1
    }
    
    var peek: T? {
        if self.isEmpty { return nil }
        return self.array[1]
    }
    
    var count: Int {
        return self.array.count - 1
    }
    
    init(from array: [T] = [], sort: @escaping (T,T) -> Bool) {
        if array.isEmpty {
            self.array = array
        } else {
            self.array = [array.first!] + array
        }
        self.orderCriteria = sort
        
        if array.count > 1 {
            self.configHeap()
        }
    }
    
    func getLeftChildIndex(of index: Int) -> Int {
        return index * 2
    }
    
    func getRightChildIndex(of index: Int) -> Int {
        return index * 2 + 1
    }
    
    func getParentIndex(of index: Int) -> Int {
        return index / 2
    }
    
    mutating func shiftUp(from index: Int) {
        var index = index
        while index != 1 && self.orderCriteria(self.array[index], self.array[self.getParentIndex(of: index)]) {
            self.array.swapAt(index, self.getParentIndex(of: index))
            index = self.getParentIndex(of: index)
        }
    }
    
    mutating func shiftDown(from index: Int) {
        var higherPriority = index
        let leftChildIndex = self.getLeftChildIndex(of: index)
        let rightChildIndex = leftChildIndex + 1
        
        if leftChildIndex < self.array.count && self.orderCriteria(self.array[leftChildIndex], self.array[higherPriority]) {
            higherPriority = leftChildIndex
        }
        
        if rightChildIndex < self.array.count && self.orderCriteria(self.array[rightChildIndex], self.array[higherPriority]) {
            higherPriority = rightChildIndex
        }
        
        if higherPriority != index {
            self.array.swapAt(index, higherPriority)
            self.shiftDown(from: higherPriority)
        }
    }
    
    mutating func insert(node: T) {
        if self.array.isEmpty {
            self.array.append(node)
            return
        }
        self.array.append(node)
        
        self.shiftUp(from: self.array.count - 1)
    }
    
    mutating func configHeap() {
        for i in stride(from: self.array.count / 2, through: 1, by: -1) {
            self.shiftDown(from: i)
        }
    }
    
    mutating func pop() -> T? {
        if self.isEmpty { return nil }
        self.array.swapAt(1, self.array.count - 1)
        
        let deleted = self.array.removeLast()
        self.shiftDown(from: 1)
        return deleted
    }
}


/*
var minHeap = Heap(from: [6,14,10,5,7]) { $0 < $1 }
var maxHeap = Heap(from: [6,14,10,5,7]) { $0 > $1 }
*/
