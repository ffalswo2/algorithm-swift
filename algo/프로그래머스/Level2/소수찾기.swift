//
//  Lv2. 소수찾기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/42839
//  Created by 김민재 on 2022/08/22.
//

import Foundation

func solution(_ numbers:String) -> Int {
  
  func permutation<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }
    
    var visited = Array(repeating: false, count: array.count)
    
    func cycle(_ now: [T]) {
      if now.count == n {
        result.append(now)
        return
      }
      
      for i in 0..<array.count {
        if visited[i] {
          continue
        } else {
          visited[i] = true
          cycle(now + [array[i]])
          visited[i] = false
        }
      }
    }
    
    cycle([])
    
    return result
  }
  
  func isPrime(_ num: Int) -> Bool {
    if num < 2 { return false }
    
    for i in 2..<(Int(sqrt(Double(num))) + 1) {
      if num % i == 0 {
        return false
      }
    }
    
    return true
  }
  
  var answer = 0
  for cnt in 1...numbers.count {
    let per = Set(permutation(Array(numbers), cnt).map({
      Int(String($0))!
    }))
    
    for i in per {
      if String(i).count != cnt { continue }
      
      if isPrime(i) {
        answer += 1
      }
    }
  }
  
  return answer
}

solution("17")
//solution("011")

