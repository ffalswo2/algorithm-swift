//
//  평균 구하기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12944
//  Created by 김민재 on 2022/08/17.
//

import Foundation


func solution(_ arr:[Int]) -> Double {
    return arr.reduce(0.0) { $0 + Double($1) } / Double(arr.count)
}

solution([1,2,3,4])
solution([5,5])
