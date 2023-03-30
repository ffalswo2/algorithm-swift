//
//  최대공약수와 최소공배수.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12940
//  Created by 김민재 on 2022/08/17.
//

import Foundation


func solution(_ n:Int, _ m:Int) -> [Int] {
    func gcd(_ a: Int, _ b: Int) -> Int {
        if a % b == 0 {
            return b
        }
        return gcd(b, a % b)
    }
    
    let b = max(n, m)
    let s = min(n, m)
    
    let g = gcd(b, s)
    let l = (n / g) * (m / g) * g
    
    return [g, l]
}


print(solution(2, 5))
