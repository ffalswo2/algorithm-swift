//
//  3진법 뒤집기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/68935
//  Created by 김민재 on 2022/08/09.
//

import Foundation


func solution(_ n:Int) -> Int {
    return Int(String(String(n, radix: 3).reversed()), radix: 3)!
}

solution(45)
solution(125)
