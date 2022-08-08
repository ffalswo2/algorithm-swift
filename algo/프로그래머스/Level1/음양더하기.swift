//
//  음양 더하기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/76501
//  Created by 김민재 on 2022/08/07.
//

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var answer = 0
    for idx in 0..<signs.count {
        if signs[idx] {
            answer += absolutes[idx]
        } else {
            answer += (-absolutes[idx])
        }
    }
    
    return answer
}

solution([4,7,12]    , [true,false,true]    )
