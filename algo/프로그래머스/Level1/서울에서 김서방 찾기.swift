//
//  서울에서 김서방 찾기.swift
//  https://school.programmers.co.kr/learn/courses/30/lessons/12919
//
//  Created by 김민재 on 2022/08/14.
//

import Foundation

func solution(_ seoul:[String]) -> String {
    let arr = Array(seoul)
    var kimIdx = 0
    for (idx, str) in arr.enumerated() {
        if str == "Kim" {
            kimIdx = idx
        }
    }
    return "김서방은 \(kimIdx)에 있다"
}

func betterSolution(_ seoul:[String]) -> String {
    return "김서방은 \(seoul.firstIndex(of: "Kim")!)에 있다"
}
