//
//  행렬의 곱셈.swift
//  algo lv.2
//  https://school.programmers.co.kr/learn/courses/30/lessons/12949
//  Created by 김민재 on 2022/09/01.
//

import Foundation


func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    var answer = [[Int]](repeating: [Int](repeating: 0, count: arr2[0].count), count: arr1.count)
    
    for i in 0..<arr1.count {
        for j in 0..<arr2[0].count {
            for k in 0..<arr1[i].count {
                answer[i][j] += arr1[i][k] * arr2[k][j]
            }
        }
    }
    
    return answer
}

_ = solution([[1, 4], [3, 2], [4, 1]], [[3, 3], [3, 3]])
solution([[2, 3, 2], [4, 2, 4], [3, 1, 4]]    , [[5, 4, 3], [2, 4, 1], [3, 1, 1]]    )
