//
//  최장 맨해튼 거리.swift
//  algo
//
//  Created by 김민재 on 2022/10/09.
//

import Foundation

let n = readLine()!.split(separator: " ").map { Int($0)! }.sorted { lhs, rhs in
    return abs(lhs) < abs(rhs)
}

var first = n[0] - n[3] > 0 ? n[0] - n[3] : n[3] - n[0]
var second = n[2] - n[1] > 0 ? n[2] - n[1] : n[1] - n[2]
let a1 = first + second

first = n[1] - n[0] > 0 ? n[1] - n[0] : n[0] - n[1]
second = n[3] - n[2] > 0 ? n[3] - n[2] : n[2] - n[3]
let a2 = first + second


print(max(a1, a2))
