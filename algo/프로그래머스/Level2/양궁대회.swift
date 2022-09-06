//
//  양궁대회.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/92342
//  Created by 김민재 on 2022/08/29.
//

import Foundation


func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var apeach = info
    var ryan = Array(repeating: 0, count: 11)
    
    var maxDiff = 0
    var answer: [Int] = [-1]
    func isAnswer(_ ryan: [Int]) -> Bool {
        for i in stride(from: 10, through: 0, by: -1){
            if ryan[i] > answer[i] { return true }
            else if ryan[i] < answer[i] { return false }
        }
        return true
    }
    
    func calScore(ryan: [Int], apeach: [Int]) {
        var rScore = 0
        var aScore = 0
        for i in 0..<11 {
            if ryan[i] > apeach[i] { rScore += 10 - i }
            else if apeach[i] > 0 { aScore += 10 - i }
        }
        
        let tmp = rScore - aScore
        if tmp > 0 && tmp >= maxDiff {
            if maxDiff == tmp && !isAnswer(ryan) { return }
            
            maxDiff = tmp
            answer = ryan
        }
    }
    
    func dfs(idx: Int, arrows: Int, ryan: inout [Int], apeach: inout [Int]) {
        if idx == 11 || arrows <= 0 {
            ryan[10] += arrows
            calScore(ryan: ryan, apeach: apeach)
            ryan[10] -= arrows
            return
        }
        
        if apeach[idx] < arrows {
            ryan[idx] += apeach[idx] + 1
            dfs(idx: idx+1, arrows: arrows-apeach[idx]-1, ryan: &ryan, apeach: &apeach)
            ryan[idx] -= apeach[idx] + 1
        }
        
        dfs(idx: idx+1, arrows: arrows, ryan: &ryan, apeach: &apeach)
    }
    
    
    
    dfs(idx: 0, arrows: n, ryan: &ryan, apeach: &apeach)
//    print(answer)
    return answer
}

solution(5, [2,1,1,1,0,0,0,0,0,0,0])
solution(1, [1,0,0,0,0,0,0,0,0,0,0])
solution(9, [0,0,1,2,0,1,1,1,1,1,1])
solution(10, [0,0,0,0,0,0,0,0,3,4,3])
