//
//  두 개 뽑아서 더하기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/68644
//  Created by 김민재 on 2022/08/10.
//

import Foundation


func solution(_ numbers:[Int]) -> [Int] {
    var result = Set<Int>()
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            result.insert(numbers[i] + numbers[j])
        }
    }
    
    return Array(result).sorted()
}

solution([5,0,2,7]    )
