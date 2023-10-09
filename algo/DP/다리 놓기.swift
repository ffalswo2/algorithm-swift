//
//  다리 놓기.swift
//  algo
//
//  Created by 김민재 on 10/8/23.
//

import Foundation


let T = Int(readLine()!)!
for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0] // 서쪽 -> 1
    let m = input[1] // 동쪽 -> 5
    // m C n
    // 5 C 1

    var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

    func combi(_ n: Int, _ r: Int) -> Int {
        if n == r || r == 0 { return 1 }

        if dp[n][r] != 0 { return dp[n][r] }

        dp[n][r] = combi(n-1, r-1) + combi(n-1, r)
        return dp[n][r]
    }

    print(combi(m, n))
}
