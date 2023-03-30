//
//  정수 제곱근 판별.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12934
//  Created by 김민재 on 2022/08/17.
//

import Foundation


func solution(_ n:Int64) -> Int64 {
    
    for i in 1...Int(sqrt(Double(n))) + 1 {
        if i * i == n {
            let a = i + 1
            return Int64(a * a)
        }
    }
    
    return -1
}

/*
 테스트 1 〉    통과 (0.18ms, 16.5MB)
 테스트 2 〉    통과 (556.50ms, 16.4MB)
 테스트 3 〉    통과 (0.26ms, 16.4MB)
 테스트 4 〉    통과 (97.38ms, 16.6MB)
 테스트 5 〉    통과 (1.90ms, 16.4MB)
 테스트 6 〉    통과 (0.04ms, 16.3MB)
 테스트 7 〉    통과 (4.45ms, 16.3MB)
 테스트 8 〉    통과 (0.83ms, 16.4MB)
 테스트 9 〉    통과 (2.52ms, 16.4MB)
 테스트 10 〉    통과 (6.44ms, 16.4MB)
 테스트 11 〉    통과 (6.26ms, 16.2MB)
 테스트 12 〉    통과 (10.76ms, 16.4MB)
 테스트 13 〉    통과 (0.05ms, 16.4MB)
 테스트 14 〉    통과 (5.20ms, 16.3MB)
 테스트 15 〉    통과 (1.56ms, 16.5MB)
 테스트 16 〉    통과 (0.87ms, 16.3MB)
 테스트 17 〉    통과 (0.02ms, 16.5MB)
 테스트 18 〉    통과 (0.03ms, 16.6MB)
 */

func sol2(_ n: Int64) -> Int64 {
    let a = Int(sqrt(Double(n)))
    return Int64(a * a == n ? (a+1) * (a+1) : -1)
}

/*
 테스트 1 〉    통과 (0.01ms, 16.4MB)
 테스트 2 〉    통과 (0.02ms, 16.4MB)
 테스트 3 〉    통과 (0.02ms, 16.3MB)
 테스트 4 〉    통과 (0.03ms, 16.2MB)
 테스트 5 〉    통과 (0.02ms, 16.2MB)
 테스트 6 〉    통과 (0.02ms, 16.3MB)
 테스트 7 〉    통과 (0.02ms, 16.4MB)
 테스트 8 〉    통과 (0.02ms, 16.4MB)
 테스트 9 〉    통과 (0.02ms, 16.2MB)
 테스트 10 〉    통과 (0.02ms, 16.4MB)
 테스트 11 〉    통과 (0.03ms, 16.6MB)
 테스트 12 〉    통과 (0.03ms, 16.4MB)
 테스트 13 〉    통과 (0.02ms, 16.6MB)
 테스트 14 〉    통과 (0.02ms, 16.4MB)
 테스트 15 〉    통과 (0.02ms, 16.5MB)
 테스트 16 〉    통과 (0.02ms, 16.2MB)
 테스트 17 〉    통과 (0.02ms, 16.4MB)
 테스트 18 〉    통과 (0.02ms, 16.3MB)
 */

//solution(1)
print(sol2(121))
//print(solution(50000000000000))
//solution(121)
//solution(3)
