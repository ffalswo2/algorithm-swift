//
//  1182_부분수열의합.swift
//  algo
//
//  Created by 김민재 on 2023/08/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let S = input[1]
let nums = readLine()!.split(separator: " ").map { Int($0)! }


// 1. 조합을 이용한 풀이
//var answer: [[Int]] = []
//func combination(start: Int, nums: [Int], r: Int) {
//    var nums = nums
//    if nums.count == r {
//        answer.append(nums)
//        return
//    }
//
//    for i in start+1..<N {
//        nums.append(i)
//        combination(start: i, nums: nums, r: r)
//        nums.popLast()
//    }
//    return
//}
//
//var count = 0
//for r in 1...N {
//    combination(start: -1, nums: [], r: r)
//    for ans in answer {
//        var sum = 0
//        for a in ans {
//            sum += nums[a]
//        }
//        if sum == S {
//            count += 1
//        }
//    }
//    answer = []
//}
//print(count)

var count = 0
var currentSum = 0

func dfs(depth: Int) {
    if depth == N { return }

    if currentSum + nums[depth] == S {
        count += 1
    }

    dfs(depth: depth + 1) // 포함안했을 때
    currentSum += nums[depth]
    dfs(depth: depth + 1) // 포함했을 때
    currentSum -= nums[depth]
}

dfs(depth: 0)

print(count)
