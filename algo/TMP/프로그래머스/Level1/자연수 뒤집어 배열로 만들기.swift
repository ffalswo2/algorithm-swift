//
//  자연수 뒤집어 배열로 만들기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12932
//  Created by 김민재 on 2022/08/17.
//

import Foundation


func solution(_ n:Int64) -> [Int] {
    return Array(String(n)).reversed().map { str in
        Int(String(str))!
    }
}

func sol2(_ n:Int64) -> [Int] {
    return "\(n)".compactMap { $0.hexDigitValue }.reversed()
}

//solution(12345)
sol2(1234567)
