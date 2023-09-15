//
//  다트게임-2.swift
//  algo
//
//  Created by 김민재 on 2023/09/16.
//

import Foundation

func solution(_ dartResult:String) -> Int {

    var scores = dartResult.split { $0.isLetter || $0 == "*" || $0 == "#" }.map { Int($0)! } // 1, 2, 3
    var ops = dartResult.split { $0.isNumber }  // S, D*, T

    var results = Array(repeating: 0, count: scores.count)
    for i in 0..<scores.count {

        var score = scores[i]
        let op = ops[i]

        for p in op {
            if p == "D" {
                score *= score
            } else if p == "T" {
                var tmp = score
                score *= tmp
                score *= tmp
            } else if p == "*" {
                // 처음
                score *= 2
                if i == 0 {
                    continue
                }
                results[i - 1] *= 2
            } else if p == "#" {
                score *= -1
            }
        }
        results[i] = score
    }

    return results.reduce(0, +)
}
