//
//  모의고사.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/42840?language=swift
//  Created by 김민재 on 2022/08/08.
//

import Foundation


func solution(_ answers:[Int]) -> [Int] {
    let one = [1,2,3,4,5]
    let two = [2,1,2,3,2,4,2,5]
    let three = [3,3,1,1,2,2,4,4,5,5]
    
    var cnt = [0,0,0]
    
    for (idx, answer) in answers.enumerated() {
        if answer == one[idx % 5] {
            cnt[0] += 1
        }
        if answer == two[idx % two.count] {
            cnt[1] += 1
        }
        if answer == three[idx % three.count] {
            cnt[2] += 1
        }
    }
    
    let maxCnt = cnt.max()!
    var result: [Int] = []
    for (idx, c) in cnt.enumerated() {
        if maxCnt == c {
            result.append(idx + 1)
        }
    }
    
    return result.sorted()
}

solution([1,3,2,4,2]    )
