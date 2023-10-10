//
//  설탕배달.swift
//  algo
//
//  Created by 김민재 on 10/11/23.
//

import Foundation


func solution1() {
    let n = Int(readLine()!)!

    var dp = Array(repeating: false, count: n+1)
    var countDp = Array(repeating: 0, count: n+1)

    func isPossible(_ n: Int) -> Bool {

        if dp[n] == true {
            return true
        }
        
        if n == 4 || n < 3 {
            return false
        }

        if n % 3 == 0 || n % 5 == 0 {
            return true
        }
        
        dp[n] = isPossible(n - 3)
        if dp[n] == false {
            dp[n] = isPossible(n - 5)
        }
        return dp[n]
    }

    if n < 3 || n == 4 {
        print(-1)
    } else if n == 3 || n == 5 {
        print(1)
    } else {
        countDp[3] = 1
        countDp[4] = -1
        countDp[5] = 1

        for i in 6...n {
            if isPossible(i) {
                if i - 5 < 3 {
                    countDp[i] = countDp[i-3] + 1
                } else {
                    if countDp[i - 3] == -1 {
                        countDp[i] = countDp[i - 5] + 1
                    } else if countDp[i - 5] == -1 {
                        countDp[i] = countDp[i-3] + 1
                    } else {
                        countDp[i] = min(countDp[i - 3], countDp[i-5]) + 1
                    }
                }
            } else {
                countDp[i] = -1
            }
        }
        
        print(countDp[n])
    }
}


func solution2() {
    let n = Int(readLine()!)!
    let inf = 999999999
    
    var dp = Array(repeating: inf, count: 5001)
    dp[3] = 1
    dp[5] = 1
    
    if n >= 6 {
        for i in 6...n {
            dp[i] = min(dp[i-3], dp[i-5]) + 1
        }
    }
    
    if dp[n] >= inf {
        print(-1)
    } else {
        print(dp[n])
    }
    
}

solution2()
