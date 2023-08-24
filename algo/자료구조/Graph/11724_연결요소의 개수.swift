//
//  11724_연결요소의 개수.swift
//  algo
//
//  Created by 김민재 on 2023/08/25.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0] // 정점의 개수
let M = input[1] // 간선의 개수

var adjList: [[Int]] = Array(repeating: [], count: N + 1)
var visited: [Bool] = Array(repeating: false, count: N + 1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]

    adjList[u].append(v)
    adjList[v].append(u)
}


func dfs(start: Int) {

    visited[start] = true

    for v in adjList[start] {
        if visited[v] { continue }
        dfs(start: v)
    }
}

var count = 0
for i in 1...N {
    if visited[i] { continue }
    dfs(start: i)
    count += 1
}

print(count)
