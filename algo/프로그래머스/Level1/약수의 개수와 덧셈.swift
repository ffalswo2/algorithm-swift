//
//  약수의 개수와 덧셈.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/77884
//  Created by 김민재 on 2022/08/09.
//

import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var result = 0
    for num in left...right {
        var cnt = 0
        for i in 1...num {
            if num % i == 0 {
                cnt += 1
            }
        }
        
        if cnt % 2 == 0 {
            result += num
        } else {
            result -= num
        }
    }
    
    return result
}

solution(24, 27)
