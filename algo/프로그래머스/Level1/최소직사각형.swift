//
//  최소직사각형.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/86491
//  Created by 김민재 on 2022/08/10.
//

import Foundation


func solution(_ sizes:[[Int]]) -> Int {
    var big: [Int] = []
    var small: [Int] = []
    
    for size in sizes {
        let w = size[0]
        let h = size[1]
        
        if w > h {
            big.append(w)
            small.append(h)
        } else {
            big.append(h)
            small.append(w)
        }
    }
    
    return big.max()! * small.max()!
}

solution([[60, 50], [30, 70], [60, 30], [80, 40]])
solution([[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]])
solution([[14, 4], [19, 6], [6, 16], [18, 7], [7, 11]])
