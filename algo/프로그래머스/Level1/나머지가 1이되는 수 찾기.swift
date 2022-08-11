//
//  나머지가 1이 되는 수 찾기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/87389
//  Created by 김민재 on 2022/08/10.
//

import Foundation


func solution(_ n:Int) -> Int {
    
    for i in 1..<n {
        if n % i == 1 {
            print(i)
            return i
        }
    }
    
    return 0
}

solution(10)
solution(12)
