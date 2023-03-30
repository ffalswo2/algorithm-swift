//
//  예산.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12982
//  Created by 김민재 on 2022/08/10.
//

import Foundation


func solution(_ d:[Int], _ budget:Int) -> Int {
    var left = budget
    var cnt = 0
    for req in d.sorted() {
        if left < req {
            return cnt
        }
        left -= req
        cnt += 1
    }
    
    return cnt
}

func betterSolution(_ d:[Int], _ budget:Int) -> Int {
    var budget = budget

    return d.sorted().filter {
        budget -= $0
        return budget >= 0
    }.count
}

solution([2,2,3,3]    , 10)
betterSolution([1,3,2,5,4], 9)
