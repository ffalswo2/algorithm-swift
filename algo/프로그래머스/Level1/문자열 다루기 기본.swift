//
//  문자열 다루기 기본.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12918
//  Created by 김민재 on 2022/08/14.
//

import Foundation

func solution(_ s:String) -> Bool {
    return (s.count == 4 || s.count == 6) && (Int(s) != nil)
}

solution("a234")
solution("1234")
