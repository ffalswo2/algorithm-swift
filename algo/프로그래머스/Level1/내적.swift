//
//  내적.swift
//  algo
//
//  Created by 김민재 on 2022/08/07.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var answer = 0
    
    for idx in 0..<a.count {
        answer += (a[idx] * b[idx])
    }
    
    return answer
}

solution([1,2,3,4]    , [-3,-1,0,2]    )
