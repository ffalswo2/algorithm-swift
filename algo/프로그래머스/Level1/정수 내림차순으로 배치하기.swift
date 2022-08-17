//
//  정수 내림차순으로 배치하기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12933
//  Created by 김민재 on 2022/08/17.
//

import Foundation


func solution(_ n:Int64) -> Int64 {
    var answer = ""
    
    let a = Array(String(n)).map { str in
        Int(String(str))!
    }.sorted(by: >).map { answer += String($0) }
    
    return Int64(answer)!
}

/*
 테스트 1 〉    통과 (0.13ms, 16.1MB)
 테스트 2 〉    통과 (0.13ms, 16.3MB)
 테스트 3 〉    통과 (0.13ms, 16.3MB)
 테스트 4 〉    통과 (0.14ms, 16.2MB)
 테스트 5 〉    통과 (0.12ms, 16.5MB)
 테스트 6 〉    통과 (0.13ms, 16.3MB)
 테스트 7 〉    통과 (0.13ms, 16.4MB)
 테스트 8 〉    통과 (0.14ms, 16.2MB)
 테스트 9 〉    통과 (0.13ms, 16.2MB)
 테스트 10 〉    통과 (0.18ms, 16.3MB)
 테스트 11 〉    통과 (0.13ms, 16.2MB)
 테스트 12 〉    통과 (0.24ms, 16.4MB)
 테스트 13 〉    통과 (0.15ms, 16.6MB)
 테스트 14 〉    통과 (0.13ms, 16.4MB)
 테스트 15 〉    통과 (0.12ms, 16.5MB)
 테스트 16 〉    통과 (0.13ms, 16.3MB)
 */


func sol2(_ n:Int64) -> Int64 {
    return Int64(String(String(n).sorted(by: >)))!
}

solution(118372)
sol2(118372)
