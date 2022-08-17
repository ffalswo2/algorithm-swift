//
//  하샤드 수.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12947
//  Created by 김민재 on 2022/08/17.
//

import Foundation


func solution(_ x:Int) -> Bool {
    var result = 0
    let arr = Array(String(x)).compactMap { char in
        result += Int(String(char))!
    }
    return x % result == 0
}

solution(18)
