//
//  소수찾기.swift
//  algo
//
//  Created by 김민재 on 2022/10/09.
//

import Foundation

func isPrime(_ num: Int) -> Bool {
    if num <= 1 {
        return false
    }
    
    
    for i in 2..<(Int(sqrt(Double(num)))+1) {
        if num % i == 0 {
            return false
        }
    }
    return true
}

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }

var answer = 0
for i in nums.indices {
    if isPrime(i+1) {
        answer += nums[i]
    }
}
print(answer)
