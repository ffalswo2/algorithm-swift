//
//  86971_전력망 둘로 나누기.swift
//  algo
//
//  Created by 김민재 on 2023/09/05.
//


import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {

    var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1 ), count: n + 1)

    for w in wires {
        graph[w[0]][w[1]] = 1
        graph[w[1]][w[0]] = 1
    }

    func bfs(_ start: Int) -> Int {
        var visited = Array(repeating: false, count: n + 1)
        var count = 0

        var q = [start]
        var qIndex = 0

        visited[start] = true
        while q.count > qIndex {
            let now = q[qIndex]
            qIndex += 1

            for (idx, w) in graph[now].enumerated() {
                if w == 1 && !visited[idx] {
                    q.append(idx)
                    visited[idx] = true
                    count += 1
                }
            }
        }

        return count
    }

    var answer = Int.max
    for w in wires {
        graph[w[0]][w[1]] = 0
        graph[w[1]][w[0]] = 0


        let a = bfs(w[0])
        let b = bfs(w[1])

        answer = min(abs(a - b), answer)


        graph[w[0]][w[1]] = 1
        graph[w[1]][w[0]] = 1
    }



    return answer
}
