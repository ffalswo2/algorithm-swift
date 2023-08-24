//
//  4673_셀프넘버.swift
//  algo
//
//  Created by 김민재 on 2023/08/24.
//

import Foundation

let maxNum = 10000

var mem = Array(repeating: false, count: maxNum + 1)

func selfNum(num: Int) -> Int {
    let str = Array(String(num))
    var sum = 0
    for s in str {
        sum += Int(String(s))!
    }
    sum += num
    return sum
}

for i in 1...maxNum {
    let dn = selfNum(num: i)
    if dn > maxNum { continue }
    mem[dn] = true
}

for i in 1...maxNum {
    if mem[i] { continue }
    print(i)
}

