//
//  문자열 내 마음대로 정렬하기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12915
//  Created by 김민재 on 2022/08/13.
//

import Foundation


func solution(_ strings:[String], _ n:Int) -> [String] {
    
    let answer = strings.sorted { lhs, rhs in
        if lhs[lhs.index(lhs.startIndex, offsetBy: n)] == rhs[rhs.index(rhs.startIndex, offsetBy: n)] {
            return lhs < rhs
        }
        
        return lhs[lhs.index(lhs.startIndex, offsetBy: n)] < rhs[rhs.index(rhs.startIndex, offsetBy: n)]
    }
    
    
    return answer
}


solution(["abce", "abcd", "cdx"]        , 2)
