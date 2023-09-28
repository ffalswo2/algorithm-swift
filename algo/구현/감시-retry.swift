//
//  감시-retry.swift
//  algo
//
//  Created by 김민재 on 9/28/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var board: [[Int]] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    board.append(input)
}

let dy = [1, 0, -1, 0] // 상 우 하 좌
let dx = [0, 1, 0, -1]

var cameras: [(Int, Int, Int)] = [] // (cctv타입, y, x)
var answer = 0 // 처음 0의 개수
for i in 0..<n {
    for j in 0..<m {
        if board[i][j] > 0 && board[i][j] < 6 {
            cameras.append((board[i][j], i, j))
        } else if board[i][j] == 0 {
            answer += 1
        }
    }
}

func coverArea(board: inout [[Int]], y: Int, x: Int, dir: Int) -> Int {
    var dir = dir
    dir %= 4

    var coverCnt = 0
    var ny = y + dy[dir]
    var nx = x + dx[dir]

    while 0..<n ~= ny && 0..<m ~= nx && board[ny][nx] != 6 {
        if board[ny][nx] == 0 {
            board[ny][nx] = -1 // 탐색영역 칠하기
            coverCnt += 1 // 탐색영역 카운트 증가
            ny += dy[dir]
            nx += dx[dir]
        } else {
            ny += dy[dir]
            nx += dx[dir]
        }


    }

    return coverCnt

}

func checkArea(board: inout [[Int]], camera: Int, y: Int, x: Int, dir: Int) -> Int {
    // 체크해서 체크한 수를 return할 예정
    var cnt = 0

    switch camera {
    case 1:
        cnt += coverArea(board: &board, y: y, x: x, dir: dir)

    case 2:
        cnt += coverArea(board: &board, y: y, x: x, dir: dir)
        cnt += coverArea(board: &board, y: y, x: x, dir: dir + 2)
    case 3:
        cnt += coverArea(board: &board, y: y, x: x, dir: dir)
        cnt += coverArea(board: &board, y: y, x: x, dir: dir + 1)

    case 4:
        cnt += coverArea(board: &board, y: y, x: x, dir: dir)
        cnt += coverArea(board: &board, y: y, x: x, dir: dir + 1)
        cnt += coverArea(board: &board, y: y, x: x, dir: dir + 2)
    case 5:
        cnt += coverArea(board: &board, y: y, x: x, dir: dir)
        cnt += coverArea(board: &board, y: y, x: x, dir: dir + 1)
        cnt += coverArea(board: &board, y: y, x: x, dir: dir + 2)
        cnt += coverArea(board: &board, y: y, x: x, dir: dir + 3)
    default: break
    }

    return cnt

}

var tmp = answer

func dfs(board: [[Int]], cameraIdx: Int, cnt: Int) {

    if cameraIdx >= cameras.count {
        tmp = min(tmp, answer - cnt)
        return
    }
    
    var tmpBoard = board

    let camera = cameras[cameraIdx]
    let cam = camera.0
    let y = camera.1
    let x = camera.2

    for i in 0..<4 {
        let checkCnt = checkArea(board: &tmpBoard, camera: cam, y: y, x: x, dir: i)

        dfs(board: tmpBoard, cameraIdx: cameraIdx + 1, cnt: cnt + checkCnt)
        tmpBoard = board // 초기화
    }
}


dfs(board: board, cameraIdx: 0, cnt: 0)
print(tmp)
