//
//  main.swift
//  algo
//
//  Created by 김민재 on 2023/08/25.
//

import Foundation

let N = Int(readLine()!)!
let num = Int(readLine()!)!

var adjList: [[Int]] = Array(repeating: [], count: N + 1)
var visited = Array(repeating: false, count: N + 1)

for _ in 0..<num {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]

    adjList[u].append(v)
    adjList[v].append(u)
}

func bfs(start: Int) -> Int {
    var q: [Int] = [start]
    var qIndex = 0

    visited[start] = true

    var count = 0

    while qIndex < q.count {
        var vertex = q[qIndex]
        qIndex += 1

        for v in adjList[vertex] {
            if visited[v] { continue }
            count += 1
            q.append(v)
            visited[v] = true
        }
    }
    return count

}

print(bfs(start: 1))
