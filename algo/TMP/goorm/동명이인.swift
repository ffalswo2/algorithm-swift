//
//  동명이인.swift
//  algo
//
//  Created by 김민재 on 2022/10/09.
//

import Foundation

let n = readLine()!.split(separator: " ")
let num = Int(n[0])!

var answer = 0
for _ in 0..<num {
    let name = readLine()!
    if name.contains(n[1]) {
        print(name)
        answer += 1
    }
}

print(answer)
