//
//  소수 찾기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12921
//  Created by 김민재 on 2022/08/14.
//

import Foundation


func solution(_ n:Int) -> Int {
    var era = [Int](repeating: 1, count: n+1)
    
    for i in 2..<Int(sqrt(Double(n))) + 1 {
        var j = 2
        if era[i] == 1 {
            while i * j <= n {
                era[i * j] = 0
                j += 1
            }
        }
    }
    
    var cnt = 0
    for i in era[2...] {
        if i == 1 {
            cnt += 1
        }
    }
    
    return cnt
}


solution(5)
