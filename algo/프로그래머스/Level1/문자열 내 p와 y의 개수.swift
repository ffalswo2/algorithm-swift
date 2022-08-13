//
//  문자열 내 p와 y의 개수.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12916
//  Created by 김민재 on 2022/08/13.
//

import Foundation


func solution(_ s:String) -> Bool {
    
    let p = s.lowercased().filter { $0 == "p" }.count
    let y = s.lowercased().filter { $0 == "y" }.count
    
    return p == y
}


solution("pPoooyY")
solution("Pyy")
