//
//  두 정수 사이의 합.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12912
//  Created by 김민재 on 2022/08/13.
//

import Foundation

func timeOutSolution(_ a:Int, _ b:Int) -> Int64 {
    return a < b ? (a...b).reduce(Int64(0)) { $0 + Int64($1) } : (b...a).reduce(Int64(0)) { $0 + Int64($1) }
}


func solution(_ a:Int, _ b:Int) -> Int64 {
    var result = 0
    for i in (a < b ? a...b : b...a) {
        result += i
    }
    return Int64(result)
}


func mathSol(_ a:Int, _ b:Int) -> Int64 {
    return Int64(a + b) * Int64(max(a, b) - min(a, b) + 1) / 2
}

/*
 테스트 1 〉    통과 (0.01ms, 16.4MB)
 테스트 2 〉    통과 (0.01ms, 16.5MB)
 테스트 3 〉    통과 (0.01ms, 16.3MB)
 테스트 4 〉    통과 (0.01ms, 16.6MB)
 테스트 5 〉    통과 (0.01ms, 16.4MB)
 테스트 6 〉    통과 (0.01ms, 16.4MB)
 테스트 7 〉    통과 (0.01ms, 16.6MB)
 테스트 8 〉    통과 (0.01ms, 16.5MB)
 테스트 9 〉    통과 (0.01ms, 16.3MB)
 테스트 10 〉    통과 (0.01ms, 16.2MB)
 테스트 11 〉    통과 (0.01ms, 16.4MB)
 테스트 12 〉    통과 (0.01ms, 16.4MB)
 테스트 13 〉    통과 (0.01ms, 16.5MB)
 테스트 14 〉    통과 (0.01ms, 16.2MB)
 테스트 15 〉    통과 (0.01ms, 16.4MB)
 테스트 16 〉    통과 (0.01ms, 16.5MB)
 */


solution(9999999, 10000000)
mathSol(9999999, 10000000)
