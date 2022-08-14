//
//  수박수박수박수.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12922
//  Created by 김민재 on 2022/08/14.
//

import Foundation


func solution(_ n:Int) -> String {
    var result = ""
    var arr = ["수", "박"]
    for i in 0..<n {
        result += arr[i % 2]
    }
    
    return result
}

/*
 테스트 1 〉    통과 (0.08ms, 16.5MB)
 테스트 2 〉    통과 (0.27ms, 16.4MB)
 테스트 3 〉    통과 (0.22ms, 16.5MB)
 테스트 4 〉    통과 (0.38ms, 16.5MB)
 테스트 5 〉    통과 (0.19ms, 16.4MB)
 테스트 6 〉    통과 (0.01ms, 16.2MB)
 테스트 7 〉    통과 (0.01ms, 16.3MB)
 테스트 8 〉    통과 (0.02ms, 16.3MB)
 테스트 9 〉    통과 (0.02ms, 16.3MB)
 테스트 10 〉    통과 (0.02ms, 16.4MB)
 테스트 11 〉    통과 (0.02ms, 16.2MB)
 테스트 12 〉    통과 (0.01ms, 16.4MB)
 테스트 13 〉    통과 (0.02ms, 16.1MB)
 테스트 14 〉    통과 (0.02ms, 16.3MB)
 테스트 15 〉    통과 (0.74ms, 16.6MB)
 테스트 16 〉    통과 (0.01ms, 16.2MB)
 */

func sol2(_ n:Int) -> String {
    return (0..<n).map {
        $0 % 2 == 0 ? "수" : "박"
    }.reduce("", +)
}

/*
 테스트 1 〉    통과 (0.59ms, 16.3MB)
 테스트 2 〉    통과 (2.43ms, 16.5MB)
 테스트 3 〉    통과 (1.68ms, 16.4MB)
 테스트 4 〉    통과 (3.53ms, 16.5MB)
 테스트 5 〉    통과 (2.48ms, 16.2MB)
 테스트 6 〉    통과 (0.04ms, 16.2MB)
 테스트 7 〉    통과 (0.05ms, 16.2MB)
 테스트 8 〉    통과 (0.09ms, 16.5MB)
 테스트 9 〉    통과 (0.09ms, 16.5MB)
 테스트 10 〉    통과 (0.06ms, 16.2MB)
 테스트 11 〉    통과 (0.10ms, 16.4MB)
 테스트 12 〉    통과 (0.06ms, 16.5MB)
 테스트 13 〉    통과 (0.10ms, 16.5MB)
 테스트 14 〉    통과 (0.09ms, 16.2MB)
 테스트 15 〉    통과 (9.14ms, 16.5MB)
 테스트 16 〉    통과 (0.05ms, 16.3MB)
 */

solution(4)
sol2(4)
