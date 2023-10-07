//
//  1로 만들기.swift
//  algo
//
//  Created by 김민재 on 10/7/23.
//

import Foundation

// x / 3
// x / 2
// x - 1
let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n + 1) // 해당 수(KEY)까지 가는데 필요한 최소 연산 횟수 (VALUE) !


/// 바텀업 방식
if n == 1 { print(0) }
else {
    for i in 2...n {
        dp[i] = dp[i - 1] + 1

        if i % 2 == 0 {
            dp[i] = min(dp[i], dp[i / 2] + 1)
        }
        if i % 3 == 0 {
            dp[i] = min(dp[i], dp[i / 3] + 1)
        }
    }

    print(dp[n])
}

/// Top-down 탑다운 하향식 방법(메모이제이션)
//func recur(_ num: Int) -> Int {
//    if num == 1 { return 0 } // n이 1이라면 당연히 연산횟수는 0 입니다.
//    if dp[num] != 0 { return dp[num] } // dp[num]이 0이 아니라는 뜻은 이미 한번 연산해서 캐싱해놓은 적이 있다는 뜻이므로 그냥 그 값을 가져옵니다.
//
//    // 여기까지 왔다라는 것은 처음 연산을 수행하는 것이기 때문에 연산을 진행해줍니다.
//    dp[num] = recur(num - 1) + 1
//    if num % 2 == 0 {
//        dp[num] = min(dp[num], recur(num / 2) + 1)
//    }
//    if num % 3 == 0 {
//        dp[num] = min(dp[num], recur(num / 3) + 1)
//    }
//
//    return dp[num]
//}
//
//
//print(recur(n))




//func recur(_ n: Int) -> Int {
//    if n == 1 {
//        return dp[n]
//    }
//
//    if dp[n] != 0 {
//        return dp[n]
//    }
//
//    dp[n] = min(recur(n - 1), recur(n / 2), recur(n / 3)) + 1
//
//    return dp[n]
//}
//
//recur(10)
//print(dp)

// recur(10)
// recur(9)
// recur(8)
// recur(7)
// recur(6)
// recur(5)
// recur(4)
// recur(3)
// recur(2)
// recur(1) -> return 0

// recur(5)
// recur(4)
// recur(3)
