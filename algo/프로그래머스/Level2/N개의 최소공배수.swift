//
//  N개의 최소공배수.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12953
//  Created by 김민재 on 2022/08/25.
//

import Foundation


func solution(_ arr:[Int]) -> Int {
    var arr = arr.sorted()
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        if a % b == 0 {
            return b
        }
        return gcd(b, a % b)
    }
    
    func lcm(_ a: Int, _ b: Int) -> Int {
        return a * b / gcd(a, b)
    }
    
    return arr.reduce(1) { lcm($0, $1) }
}

solution([3,4,9,16])
