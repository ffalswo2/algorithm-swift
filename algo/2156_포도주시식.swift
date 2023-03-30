//
//  포도주 시식.swift
//  algo
//  https://www.acmicpc.net/problem/2156
//  Created by 김민재 on 2023/03/30.
//

import Foundation

let n = Int(readLine()!)!

var wine: [Int] = [Int](repeating: 0, count: n+1)
for i in 1...n {
    wine[i] = Int(readLine()!)!
}

if n < 3 {
    print(wine.reduce(0, +))
    exit(0)
}

var dp: [Int] = [Int](repeating: 0, count: n+1)
dp[1] = wine[1]
dp[2] = wine[1] + wine[2]

for i in 3...n {
    dp[i] = max(dp[i-3] + wine[i-1] + wine[i], dp[i-2] + wine[i]) // 마시는 경우
    dp[i] = max(dp[i], dp[i-1]) // 안마시는경우
}

print(dp[n])
