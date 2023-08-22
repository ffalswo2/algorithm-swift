//
//  1012_유기농배추.swift
//  algo
//
//  Created by 김민재 on 2023/08/23.
//

import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let M = input[0] // 배추밭 가로길이
    let N = input[1] // 세로길이
    let K = input[2] // 배수 위치의 개수

    var farmMap = Array(repeating: Array(repeating: 0, count: M), count: N)
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)

    for _ in 0..<K {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let x = input[0]
        let y = input[1]

        farmMap[y][x] = 1
    }

    let dy = [1, -1, 0, 0]
    let dx = [0, 0, 1, -1]

    var count = 0

    func bfs(y: Int, x: Int) {
        var q = [(y, x)]
        var qIndex = 0

        visited[y][x] = true

        while qIndex < q.count {
            let y = q[qIndex].0
            let x = q[qIndex].1
            qIndex += 1

            for i in 0..<4 {
                let ny = y + dy[i]
                let nx = x + dx[i]

                if ny >= N || ny < 0 || nx >= M || nx < 0 || visited[ny][nx] || farmMap[ny][nx] != 1 {
                    continue
                }
                visited[ny][nx] = true
                q.append((ny, nx))
                /*
                 Queue에 넣을 때 방문 처리를 해주지 않으면 중복해서 값이 들어감
                 예를 들어 3 x 3
                 1 1 1
                 1 1 1
                 1 1 1
                 을 예시로 해보면 이해가 된다.

                 방문 처리를 pop했을 때 처리해주는 식으로 하다보면 (1, 1) 중복값이 들어가는 것을 확인할 수 있음.

                 Queue에 넣었다는 것 자체가 방문을 했다는 것이기에 뺐을 때가 아닌 Queue에 넣는 순간 방문처리를 하는 것이 맞음.

                 */

            }
        }
    }

    for y in 0..<N {
        for x in 0..<M {
            if visited[y][x] || farmMap[y][x] != 1 { continue }
            count += 1
            bfs(y: y, x: x)
        }
    }


    print(count)
}





