//
//  나누어떨어지는 숫자 배열.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12910
//  Created by 김민재 on 2022/08/13.
//

import Foundation

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    return arr.sorted().filter { $0 % divisor == 0 }.count == 0 ? [-1] : arr.filter { $0 % divisor == 0 }.sorted()
}

solution([5, 9, 7, 10], 5)
solution([3,2,6], 10)
