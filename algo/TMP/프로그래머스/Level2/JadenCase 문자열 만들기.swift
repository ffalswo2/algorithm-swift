//
//  JadenCase 문자열 만들기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12951
//  Created by 김민재 on 2022/08/25.
//

import Foundation


func solution(_ s:String) -> String {
    var s = s.components(separatedBy: " ")
    var result: [String] = []
    for str in s {
        var tmp = ""
        for (idx, char) in str.enumerated() {
            if idx == 0 && char.isLetter {
                tmp.append(char.uppercased())
            } else if char.isNumber {
                tmp.append(char)
                continue
            } else if char.isWhitespace {
                tmp.append(char)
                continue
            } else if char.isLetter {
                tmp.append(char.lowercased())
                continue
            }
        }
        
        result.append(tmp)
    }
    
    return result.joined(separator: " ")
}

solution("3people unFollowed me")
solution("for the last week")
