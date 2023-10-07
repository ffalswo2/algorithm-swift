//
//  스티커.swift
//  algo
//  https://www.acmicpc.net/problem/9465
//  Created by 김민재 on 10/7/23.
//

import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    let n = Int(readLine()!)!

    var map: [[Int]] = []

    var dp = Array(repeating: Array(repeating: 0, count: n+1), count: 3)
    for _ in 0..<2 {
        let input = readLine()!.split(separator: " ").map({ Int($0)! })
        map.append(input)
    }

    if n == 1 {
        print(max(map[0][0], map[1][0]))
    } else {
        dp[1][1] = map[0][0]
        dp[2][1] = map[1][0]

        for i in 2...n {
            dp[0][i] = max(dp[1][i-1], dp[2][i-1])

            dp[1][i] = max(dp[0][i-1] + map[0][i-1], dp[2][i-1] + map[0][i-1])
            dp[2][i] = max(dp[0][i-1] + map[1][i-1], dp[1][i-1] + map[1][i-1])
        }


        print(max(dp[1][n], dp[2][n]))
    }


}
