//
//  크레인 인형뽑기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/64061
//  Created by 김민재 on 2022/08/07.
//

import Foundation


func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var crane = board
    var stack = [Int]()
    var picked = 0
    
    var answer = 0
    
    for m in moves {
        for y in 0..<crane.count {
            if crane[y][m - 1] != 0 {
                picked = crane[y][m - 1]
                crane[y][m - 1] = 0
                
                if let last = stack.last {
                    if last == picked {
                        stack.popLast()
                        answer += 2
                    } else {
                        stack.append(picked)
                    }
                } else {
                    stack.append(picked)
                }
                
                break
            }
        }
    }
    
    return answer
}

let _ = solution([
    [0,0,0,0,0],
    [0,0,1,0,3],
    [0,2,5,0,1],
    [4,2,4,4,2],
    [3,5,1,3,1]
], [1,5,3,5,1,2,1,4])
