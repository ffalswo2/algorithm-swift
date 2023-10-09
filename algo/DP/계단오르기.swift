//
//  계단오르기.swift
//  algo
//
//  Created by 김민재 on 10/8/23.
//

import Foundation


let n = Int(readLine()!)!

var stair = Array(repeating: 0, count: n + 1)

for i in 1...n {
    let score = Int(readLine()!)!
    stair[i] = score
}

var dp = Array(repeating: 0, count: n + 1)

if n < 3 {
    print(stair.reduce(0, +))
} else {
    dp[1] = stair[1]
    dp[2] = stair[1] + stair[2]


    for i in 3...n {
        dp[i] = max(dp[i - 3] + stair[i - 1] +  stair[i],
                    dp[i - 2] + stair[i])
    }
    print(dp[n])
}

