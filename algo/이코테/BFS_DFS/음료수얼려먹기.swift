//
//  음료수 얼려먹기.swift
//  algo
//
//  Created by 김민재 on 2023/01/03.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! } // 입력받기
let N = input[0]
let M = input[1]

var map: [[Int]] = []
for _ in 0..<N {
    map.append(readLine()!.map({ Int(String($0))!})) // 음료수 map 초기화하기
}

// 상, 하, 좌, 우
let moves = [(-1,0), (1,0), (0,-1), (0, 1)]
var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N) // 방문여부를 담을 리스트

func dfs(y: Int, x: Int) -> Bool {
    // 범위에서 out이면 바로 false return
    if y < 0 || y >= N || x < 0 || x >= M { // 범위를 벗어나게 된다면 return false
        return false
    }
    
    if map[y][x] == 0 && !visited[y][x] { // 만약 틀이 아니고, 아직 방문하지 않았다면??
        visited[y][x] = true // 방문처리해주고
        for i in 0..<4 { // 상하좌우에 관해서 dfs
            dfs(y: y + moves[i].0, x: x + moves[i].1)
        }
        return true // 모든 방향으로의 dfs탐색이 끝났다면 종료
    }
    return false // 틀이거나 방문한 곳이면 return false로 돌아가기
}

var answer = 0 // 정답값
for i in 0..<N {
    for j in 0..<M {
        if map[i][j] == 0 && !visited[i][j] { // 0이고, 방문하지 않았다면
            if dfs(y: i, x: j) { // dfs 탐색 시작, 그리고 return true로 됐다는 것은 분리된 한구역에 대한 처리가 끝났다는 것이기 때문에
                answer += 1 // 답을 1증가시킨다
            }
        }
    }
}

print(answer) // 정답값 출력
