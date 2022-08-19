//
//  성격 유형 검사하기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/118666
//  Created by 김민재 on 2022/08/19.
//

import Foundation


func solution(_ survey:[String], _ choices:[Int]) -> String {
    
    var score = [3,2,1,0,1,2,3]
    
    var dict: [Character: Int] = [:]
    
    for (i, choice) in choices.enumerated() {
        let idx = choice - 1
        let sc = score[idx]
        
        let arr = Array(survey[i])
        let notAgree = arr[0]
        let agree = arr[1]
        
        if (0...2).contains(idx) {
            dict[notAgree, default: 0] += sc
        } else if (4...6).contains(idx) {
            dict[agree, default: 0] += sc
        }
    }
    
    var result = ""
    if dict["R"] ?? 0 >= dict["T"] ?? 0 {
        result += "R"
    } else {
        result += "T"
    }
    if dict["C"] ?? 0 >= dict["F"] ?? 0 {
        result += "C"
    } else {
        result += "F"
    }
    if dict["J"] ?? 0 >= dict["M"] ?? 0 {
        result += "J"
    } else {
        result += "M"
    }
    
    if dict["A"] ?? 0 >= dict["N"] ?? 0 {
        result += "A"
    } else {
        result += "N"
    }
    
    
    return result
}

solution(["AN", "CF", "MJ", "RT", "NA"]    , [5, 3, 2, 7, 5]    )
solution(["TR", "RT", "TR"]    , [7, 1, 3])
