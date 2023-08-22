//
//  14888_연산자 끼워넣기.swift
//  algo
//
//  Created by 김민재 on 2023/08/22.
//

import Foundation


let N = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
// + - x %(/)
var ops = readLine()!.split(separator: " ").map { return Int($0)! }

var maxAns = -1000000000
var minAns = 1000000000

func dfs(accu: Int, depth: Int) {
    if depth == N {
        maxAns = max(maxAns, accu)
        minAns = min(minAns, accu)
        return
    }

    for i in 0..<4 {
        if ops[i] < 1 {
            continue
        }

        ops[i] -= 1

        var ac = accu

        switch i {
        case 0:
            ac += nums[depth]
        case 1:
            ac -= nums[depth]
        case 2:
            ac *= nums[depth]
        case 3:
            ac /= nums[depth]
        default: break
        }
        dfs(accu: ac, depth: depth + 1)

        ops[i] += 1
    }
}

dfs(accu: nums[0], depth: 1)
print(maxAns)
print(minAns)
