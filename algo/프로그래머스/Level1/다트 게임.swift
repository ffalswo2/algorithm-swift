//
//  다트 게임.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/17682
//  Created by 김민재 on 2022/08/11.
//

import Foundation

func solution(_ dartResult:String) -> Int {
    let strArr = dartResult.components(separatedBy: .decimalDigits)[1...]
    var scoreArr: [Int] = []
    
    var dartResultArr: [String] = []
    
    for char in dartResult {
        if char.isNumber {
            scoreArr.append(Int(String(char))!)
        }
    }
    
    let zipp = zip(scoreArr, strArr)
    for (score, op) in zipp {
        let scoreStr = "\(score)\(op)"
        dartResultArr.append(scoreStr)
    }
    
    print(dartResultArr)
    

    return 0
}

func solution2(_ dartResult:String) -> Int {
    let nums = dartResult.split { $0.isLetter || $0 == "#" || $0 == "*" }
    let ops = dartResult.split { $0.isNumber }
    
    var scoreList = [Int](repeating: 0, count: nums.count)
    
    
    for (idx, (num, op)) in zip(nums, ops).enumerated() {
        var score = 0
        
        if let num = Int(num) {
            if op.contains("D") {
                score = num * num
            } else if op.contains("T") {
                score = num * num * num
            } else {
                score = num
            }
        }
        
        if op.contains("*") {
            if idx > 0 {
                scoreList[idx-1] *= 2
            }
            score *= 2
        } else if op.contains("#") {
            score = -score
        }
        
        
        scoreList[idx] = score
    }

    return scoreList.reduce(0) { $0 + $1 }
}

solution2("1S*2T*3S")
