//
//  숫자 문자열과 영단어.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/81301
//  Created by 김민재 on 2022/08/05.
//

import Foundation

func solution(_ s:String) -> Int {
    
    var answer = s
    let numStringDict = [
            "zero": 0,
            "one" : 1,
            "two" : 2,
            "three": 3,
            "four": 4,
            "five": 5,
            "six": 6,
            "seven": 7,
            "eight": 8,
            "nine": 9
        ]
    let keysList = Array(numStringDict.keys)
    
    
    for key in keysList {
        if s.contains(key) {
            print(key.description)
            let numStr = String(numStringDict[key]!)
            
            answer = answer.replacingOccurrences(of: key.description, with: numStr)
        }
    }
    
    return Int(answer)!
}

let answer = solution("23four5six7")

print(answer)
