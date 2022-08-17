//
//  x만큼 간격이 있는 n개의 숫자.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12954
//  Created by 김민재 on 2022/08/18.
//

import Foundation


func solution(_ x:Int, _ n:Int) -> [Int64] {
    var answer: [Int64] = []
    
    let tmp = Int64(x)
    var num: Int64 = tmp
    
    for _ in 0..<n {
        answer.append(num)
        num += tmp
    }
    
    return answer
}

/*
 테스트 1 〉    통과 (0.03ms, 16.3MB)
 테스트 2 〉    통과 (0.03ms, 16.6MB)
 테스트 3 〉    통과 (0.04ms, 16.4MB)
 테스트 4 〉    통과 (0.04ms, 16.7MB)
 테스트 5 〉    통과 (0.03ms, 16.6MB)
 테스트 6 〉    통과 (0.02ms, 16.5MB)
 테스트 7 〉    통과 (0.03ms, 16.5MB)
 테스트 8 〉    통과 (0.03ms, 16.6MB)
 테스트 9 〉    통과 (0.03ms, 16.6MB)
 테스트 10 〉    통과 (0.03ms, 16.3MB)
 테스트 11 〉    통과 (0.04ms, 16.5MB)
 테스트 12 〉    통과 (0.04ms, 16.5MB)
 테스트 13 〉    통과 (0.04ms, 16.5MB)
 테스트 14 〉    통과 (0.04ms, 16.8MB)
 */

func solution2(_ x:Int, _ n:Int) -> [Int64] {
    return Array(1...n).map { Int64($0 * x) }
}

/*
 테스트 1 〉    통과 (0.11ms, 16.5MB)
 테스트 2 〉    통과 (0.17ms, 16.3MB)
 테스트 3 〉    통과 (0.32ms, 16.6MB)
 테스트 4 〉    통과 (0.35ms, 16.5MB)
 테스트 5 〉    통과 (0.33ms, 16.4MB)
 테스트 6 〉    통과 (0.08ms, 16.5MB)
 테스트 7 〉    통과 (0.49ms, 16.5MB)
 테스트 8 〉    통과 (0.28ms, 16.2MB)
 테스트 9 〉    통과 (0.64ms, 16.3MB)
 테스트 10 〉    통과 (0.11ms, 16.3MB)
 테스트 11 〉    통과 (0.68ms, 16.6MB)
 테스트 12 〉    통과 (0.71ms, 16.7MB)
 테스트 13 〉    통과 (0.71ms, 16.7MB)
 테스트 14 〉    통과 (0.65ms, 16.4MB)
 */

solution2(4, 3)
