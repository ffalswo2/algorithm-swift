//
//  직사각형 별찍기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12969
//  Created by 김민재 on 2022/08/18.
//

import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])

for _ in 0..<b {
    for _ in 0..<a {
        print("*", terminator: "")
    }
    print()
}


func sol2() {
    for _ in 0..<b {
        print(Array(repeating: "*", count: a).joined())
    }
}
