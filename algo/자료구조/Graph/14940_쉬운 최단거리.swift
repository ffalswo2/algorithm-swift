//
//  14940_쉬운 최단거리.swift
//  algo
//
//  Created by 김민재 on 2023/08/30.
//

import Foundation


let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 1000
let m = input[1] // 1000

let dy = [1, -1, 0, 0]
let dx = [0, 0, 1, -1]

var map: [[Int]] = []
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var answerMap: [[Int]] = []


var targetY = 0
var targetX = 0

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    if let targetIndex = input.firstIndex(of: 2) {
        targetY = i
        targetX = targetIndex
    }
    map.append(input)
    answerMap.append(input)
}


// Target 좌표 부터 전맵 BFS돌면서 돌기

func bfs(y: Int, x: Int) {
    var q = [(y, x)]
    var qIndex = 0
    visited[y][x] = true
    answerMap[y][x] = 0

    while qIndex < q.count {
        let y = q[qIndex].0
        let x = q[qIndex].1
        qIndex += 1

        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]

            if 0..<n ~= ny && 0..<m ~= nx && !visited[ny][nx] && map[ny][nx] == 1 {
                q.append((ny, nx))
                visited[ny][nx] = true
                answerMap[ny][nx] = answerMap[y][x] + 1
            }
        }
    }
}

bfs(y: targetY, x: targetX)

for i in 0..<n {
    for j in 0..<m {
        if visited[i][j] || map[i][j] == 0 { // 방문한 애들이나 원래 못가는 땅(0)은 그대로 출력
            print(answerMap[i][j], terminator: " ")
        } else if map[i][j] == 1 {
            // bfs처리를 했는데도 도달하지 못한 곳들.
            // 근데 1(갈 수 있는 땅)이면 도달할 수 없는 위치이기 때문에 -1 출력
            print(-1, terminator: " ")
        }
    }
    print("")
}



