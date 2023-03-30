//
//  짝지어 제거하기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12973
//  Created by 김민재 on 2022/08/18.
//

import Foundation

func solution(_ s:String) -> Int{
    
    var stack: [Character] = []
    
    for char in s {
        if stack.isEmpty {
            stack.append(char)
        } else {
            if stack.last! == char {
                stack.removeLast()
            } else {
                stack.append(char)
            }
        }
    }
    
    return stack.isEmpty ? 1 : 0
}

solution("cdcd")
