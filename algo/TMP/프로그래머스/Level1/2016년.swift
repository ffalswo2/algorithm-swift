//
//  2016.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12901
//  Created by 김민재 on 2022/08/10.
//

import Foundation


func solution(_ a:Int, _ b:Int) -> String {
    let days = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    let d = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    var sum = 0
    for i in 1..<a {
        sum += d[i]
    }
    sum += b
    
    return days[sum % 7]
}

solution(5, 24)
