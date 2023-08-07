//
//  main.swift
//  Minjae
//
//  Created by 김민재 on 2023/01/21.
//

import Foundation

struct Queue<T> {
  var array = [T?]()
  var head = 0
  
  var isEmpty: Bool {
    return count == 0
  }

  var count: Int {
    return array.count - head
  }
  
  mutating func enqueue(_ element: T) {
    array.append(element)
  }

  mutating func dequeue() -> T? {
    guard head < array.count, let element = array[head] else { return nil }

    array[head] = nil
    head += 1

    let percentage = Double(head)/Double(array.count)
    if array.count > 50 && percentage > 0.25 {
      array.removeFirst(head)
      head = 0
    }
    
    return element
  }
  
  var front: T? {
    if isEmpty {
      return nil
    } else {
      return array[head]
    }
  }
}

// 이게 어떻게 보면 앞으로 땡기는 방식: 비효율적인 거 아님?
