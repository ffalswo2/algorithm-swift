//
//  체육복.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/42862
//  Created by 김민재 on 2022/08/08.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var los = Array(Set<Int>(lost).subtracting(Set<Int>(reserve))).sorted()
    var res = Array(Set<Int>(reserve).subtracting(Set<Int>(lost))).sorted()
    
    var cnt = n - los.count
    
    for lo in los {
        if let idx = res.firstIndex(of: lo-1) {
            res.remove(at: idx)
            cnt += 1
        } else if let idx = res.firstIndex(of: lo+1) {
            res.remove(at: idx)
            cnt += 1
        }
    }
    
    return cnt
}

/*
 테스트 1 〉    통과 (0.15ms, 16.5MB)
 테스트 2 〉    통과 (0.18ms, 16.6MB)
 테스트 3 〉    통과 (0.26ms, 16.5MB)
 테스트 4 〉    통과 (0.17ms, 16.3MB)
 테스트 5 〉    통과 (0.16ms, 16.6MB)
 테스트 6 〉    통과 (0.14ms, 16.4MB)
 테스트 7 〉    통과 (0.17ms, 16.5MB)
 테스트 8 〉    통과 (0.15ms, 16.5MB)
 테스트 9 〉    통과 (0.16ms, 16.3MB)
 테스트 10 〉    통과 (0.19ms, 16.5MB)
 테스트 11 〉    통과 (0.14ms, 16.2MB)
 테스트 12 〉    통과 (0.14ms, 16.6MB)
 테스트 13 〉    통과 (0.14ms, 16.4MB)
 테스트 14 〉    통과 (0.19ms, 16.2MB)
 테스트 15 〉    통과 (0.15ms, 16.6MB)
 테스트 16 〉    통과 (0.22ms, 16.5MB)
 테스트 17 〉    통과 (0.14ms, 16.5MB)
 테스트 18 〉    통과 (0.14ms, 16.5MB)
 테스트 19 〉    통과 (0.14ms, 16.6MB)
 테스트 20 〉    통과 (0.13ms, 16.4MB)
 */

solution(5, [2,3,4]    , [1,3,5]    )
