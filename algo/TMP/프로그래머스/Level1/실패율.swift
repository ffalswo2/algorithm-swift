//
//  실패율.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/42889
//  Created by 김민재 on 2022/08/09.
//

import Foundation

func timeOutSolution(_ N:Int, _ stages:[Int]) -> [Int] {
    var rateDict: [Int: Double] = [:]
    
    for lev in 1...N {
        let top = stages.filter { val in
            if val == lev {
                return true
            }
            return false
        }.count
        
        let bottom = stages.filter { val in
            if val >= lev {
                return true
            }
            return false
        }.count
        
        var rate = 0.0
        if bottom != 0 {
            rate = Double(top) / Double(bottom)
        }
        rateDict[lev] = rate
    }
    
    let answer = rateDict.sorted(by: { lhs, rhs in
        if lhs.value == rhs.value {
            return lhs.key < rhs.key
        }
        return lhs.value >= rhs.value
    }).map { $0.key }
    
    return answer
}

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var rateDict: [Int: Double] = [:]
    var arr = [Int](repeating: 0, count: N+1)
    
    for stage in stages {
        for i in 0..<stage {
            arr[i] += 1
        }
    }
    
    for i in 0..<N {
        var rate = 0.0
        if arr[i] != 0 {
            rate = Double(arr[i] - arr[i+1]) / Double(arr[i])
        }
        rateDict[i+1] = rate
    }
    
    let answer = rateDict.sorted(by: { lhs, rhs in
        if lhs.value == rhs.value {
            return lhs.key < rhs.key
        }
        return lhs.value >= rhs.value
    }).map { $0.key }
    
    return answer
}

solution(5, [2, 1, 2, 6, 2, 4, 3, 3]    )
//solution(4, [4,4,4,4,4]    )
