//
//  문자열 내림차순으로 배치하기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12917
//  Created by 김민재 on 2022/08/13.
//

import Foundation

func solution(_ s:String) -> String {
    let a = s.sorted { lhs, rhs in
        return lhs > rhs
    }
    
    return String(a)
}

solution("Zbcdefg")
