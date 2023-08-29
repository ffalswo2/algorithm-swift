//
//  2178_미로탐색.swift
//  algo
//
//  Created by 김민재 on 2023/08/30.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

var map: [[Int]] = []
var visited = Array(repeating: Array(repeating: false, count: M), count: N)
var answerMap = Array(repeating: Array(repeating: 0, count: M), count: N)

for _ in 0..<N {
    let input = readLine()!.map { Int(String($0))! }
    map.append(input)
}

let dy = [1, -1, 0, 0]
let dx = [0, 0, 1, -1]

var count = 0

func bfs(y: Int, x: Int) {
    var q = [(y, x)]
    var qIndex = 0
    visited[y][x] = true
    answerMap[y][x] = 1

    while qIndex < q.count {
        let y = q[qIndex].0
        let x = q[qIndex].1
        qIndex += 1

        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]

            if 0..<N ~= ny && 0..<M ~= nx && !visited[ny][nx] && map[ny][nx] == 1 {
                q.append((ny, nx))
                visited[ny][nx] = true
                answerMap[ny][nx] = answerMap[y][x] + 1
            }
        }
    }
}

bfs(y: 0, x: 0)
print(answerMap[N-1][M-1])
