//
//  2644_촌수계산.swift
//  algo
//
//  Created by 김민재 on 2023/08/23.
//

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }
let from = input[0]
let to = input[1]

let m = Int(readLine()!)!

var family: [[Int]] = Array(repeating: [], count: n + 1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let p = input[0]
    let c = input[1]

    family[p].append(c)
    family[c].append(p)
}

var visited: [Bool] = Array(repeating: false, count: n + 1)

var answer = -1
func dfs(p: Int, target: Int, chon: Int) -> Int {
    if p == target {
        answer = chon
        return answer
    }

    visited[p] = true

    for s in family[p] {
        if visited[s] { continue }
        _ = dfs(p: s, target: target, chon: chon + 1)
    }

    return answer
}

print(dfs(p: from, target: to, chon: 0))
