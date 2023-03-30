//
//  콜라츠 추측.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12943
//  Created by 김민재 on 2022/08/17.
//

import Foundation


func solution(_ num:Int) -> Int {
    var num = num
    var result = 0
    while num != 1 {
        if result == 500 {
            return -1
        }
        if num % 2 == 0 {
            num /= 2
        } else {
            num *= 3
            num += 1
        }
        result += 1
    }
    
    return result
}

print(solution(626331))
