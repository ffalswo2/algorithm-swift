//
//  15649_N과M.swift
//  algo
//
//  Created by 김민재 on 2023/08/25.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

var nums: [Int] = []

// 1...N까지 자연수 중에서 중복 없이 M개를 고른 수열
// 길이가 M인 수열을 출력하기
// 순열

func permu() {
    if nums.count == M {
        let a = nums.map { String($0) }.joined(separator: " ")
        print(a)
        return
    }

    for i in 1...N {
        if !nums.contains(i) {
            nums.append(i)
            permu()
            nums.popLast()
        }
    }
}
permu()
//
//func combi(start: Int, b: [Int]) {
//    var b = b
//    if b.count == M {
//        for i in b {
//            print(nums[i], terminator: " ")
//        }
//        print("")
//        return
//    }
//
//    for i in start + 1..<N {
//        b.append(i)
//        combi(start: i, b: b)
//        b.popLast()
//    }
//
//}



//combi(start: -1, b: [])
//permu(n: N, r: M, depth: 0)
//permu()
