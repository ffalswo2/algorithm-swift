//
//  큰수만들기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/42883/solution_groups?language=swift
//  Created by 김민재 on 2022/09/07.
//

import Foundation


func solution(_ number:String, _ k:Int) -> String  {
  let number = number.map { String($0) }
  
  var k = k
  var stack: [String] = []
  
  
  for (idx, num) in number.enumerated() {
    while k > 0 && !stack.isEmpty && stack.last! < num {
      stack.removeLast()
      k -= 1
    }
    
    if k > 0 {
      stack.append(num)
    } else {
      stack += number[idx...]
      break
    }
  }
  
  return String(stack.joined().prefix(stack.count - k))
}

solution("1924", 2)
solution("1231234", 3)
solution("4177252841", 4)
