//
//  경로의개수.swift
//  algo
//
//  Created by 김민재 on 2022/10/09.
//

import Foundation

let n = Int(readLine()!)!
let inputs = readLine()!.split(separator: " ").map { Int($0)! }

var answer = 1
for i in inputs {
    answer *= i
}
print(answer)

