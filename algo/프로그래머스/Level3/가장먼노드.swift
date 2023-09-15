//
//  가장먼노드.swift
//  algo
//
//  Created by 김민재 on 2023/09/16.
//

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: n + 1)
    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    var distance = Array(repeating: 0, count: n + 1)


    for e in edge {
        graph[e[0]].append(e[1])
        graph[e[1]].append(e[0])
    }

    var maxDist = 0

    func bfs() {
        var q = [(1, 0)]
        var qIndex = 0
        visited[1] = true

        while qIndex < q.count {
            var node = q[qIndex].0
            var dist = q[qIndex].1
            qIndex += 1

            for v in graph[node] {
                if !visited[v] {
                    q.append((v, dist + 1))
                    visited[v] = true
                    distance[v] = dist + 1
                    maxDist = max(maxDist, dist + 1)
                }
            }
        }
    }

    bfs()

    var cnt = 0
    for d in distance {
        if d == maxDist {
            cnt += 1
        }
    }

    return cnt
}
