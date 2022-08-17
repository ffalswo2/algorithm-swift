//
//  약수의 합.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12928
//  Created by 김민재 on 2022/08/15.
//

import Foundation


func solution(_ n:Int) -> Int {
    guard n != 0 else { return 0 }
    var result = 0
    for i in 1...n {
        if n % i == 0 {
            result += i
        }
    }
    return result
}

/*
 테스트 1 〉    통과 (0.01ms, 16.4MB)
 테스트 2 〉    통과 (0.01ms, 16.2MB)
 테스트 3 〉    통과 (0.03ms, 16.3MB)
 테스트 4 〉    통과 (0.01ms, 16.3MB)
 테스트 5 〉    통과 (0.03ms, 16.4MB)
 테스트 6 〉    통과 (0.02ms, 16.3MB)
 테스트 7 〉    통과 (0.04ms, 16.3MB)
 테스트 8 〉    통과 (0.02ms, 16.1MB)
 테스트 9 〉    통과 (0.03ms, 16.3MB)
 테스트 10 〉    통과 (0.04ms, 16.3MB)
 테스트 11 〉    통과 (0.03ms, 16.5MB)
 테스트 12 〉    통과 (0.04ms, 16.3MB)
 테스트 13 〉    통과 (0.01ms, 16.3MB)
 테스트 14 〉    통과 (0.04ms, 16.1MB)
 테스트 15 〉    통과 (0.04ms, 16.3MB)
 테스트 16 〉    통과 (0.00ms, 16.3MB)
 테스트 17 〉    통과 (0.04ms, 16.5MB)
 */

func sol2(_ n:Int) -> Int {
    guard n != 0 else { return 0 }
    return (1...n).filter { n % $0 == 0 }.reduce(0, +)
}


solution(1)
