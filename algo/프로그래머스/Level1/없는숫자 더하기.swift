//
//  없는 숫자 더하기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/86051
//  Created by 김민재 on 2022/08/07.
//

import Foundation

func solution(_ numbers:[Int]) -> Int {
    let nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    var answer = 0
    
    for n in nums {
        if !numbers.contains(n) {
            answer += n
        }
    }
    
    return answer
}

func betterSolution(_ numbers:[Int]) -> Int {
    return (0...9).filter { !numbers.contains($0) }.reduce(0) { $0 + $1 }
}


//solution([1,2,3,4,6,7,8,0])

betterSolution([1,2,3,4,6,7,8,0])
