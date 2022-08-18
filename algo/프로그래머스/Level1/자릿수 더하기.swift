//
//  자릿수 더하기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12931?language=swift
//  Created by 김민재 on 2022/08/19.
//

import Foundation


func solution(_ n:Int) -> Int {
    
    return Array(String(n)).map { Int(String($0))! }.reduce(0, +)
}

func betterSol(_ n: Int) -> Int {
    return String(n).reduce(0) { $0 + Int(String($1))! }
}

betterSol(987)
