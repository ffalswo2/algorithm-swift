//
//  제일 작은 수 제거하기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12935
//  Created by 김민재 on 2022/08/17.
//

import Foundation


func solution(_ arr:[Int]) -> [Int] {
    var t = arr
    let idx = t.firstIndex(of: arr.min()!)!
    t.remove(at: idx)
    
    return t.isEmpty ? [-1] : t
}

print(solution([4,3,2,1]))
print(solution([10]))
